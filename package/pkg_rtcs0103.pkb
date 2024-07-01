CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0103 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0103
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
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0103
    WHERE   SALES_OFFICE_ID = v_Sales_Office_Id
    AND     EMP_ID          = v_Emp_Id
    AND     REGION_NO       = v_Region_No
    AND     CITY_NO         = v_City_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0103Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SALES_OFFICE_ID,           /*담당지구 코드       */
            A.EMP_ID,                    /*담당자 사번         */
            A.REGION_NO,                 /*지역코드            */
            A.CITY_NO,                   /*도시코드            */
            A.SALES_OFFICE_NAME,         /*담당지구 명         */
            A.EMP_NAME,                  /*담당자명            */
            A.REGION_NAME,               /*지역명              */
            A.CITY_NAME,                 /*도시명              */
            A.EMP_MOBILENO,              /*담당자Mobile No     */
            A.REG_ID,                    /*등록자ID            */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자ID            */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0103 A
    WHERE   A.SALES_OFFICE_ID  = DECODE(v_Sales_Office_Id, NULL, A.SALES_OFFICE_ID , v_Sales_Office_Id)
    AND     A.EMP_ID           = DECODE(v_Emp_Id         , NULL, A.EMP_ID          , v_Emp_Id)
    AND     A.REGION_NO        = DECODE(v_Region_No      , NULL, A.REGION_NO       , v_Region_No)
    AND     A.CITY_NO          = DECODE(v_City_No        , NULL, A.CITY_NO         , v_City_No)
    AND     A.SALES_OFFICE_NAME = DECODE(v_Sales_Office_Nm, NULL, A.SALES_OFFICE_NAME, v_Sales_Office_Nm)
    AND     A.EMP_NAME         = DECODE(v_Emp_Name       , NULL, A.EMP_NAME        , v_Emp_Name)
    AND     A.REGION_NAME      = DECODE(v_Region_Name    , NULL, A.REGION_NAME     , v_Region_Name)
    AND     A.CITY_NAME        = DECODE(v_City_Name      , NULL, A.CITY_NAME       , v_City_Name)
    AND     A.EMP_MOBILENO     = DECODE(v_Emp_Mobileno   , NULL, A.EMP_MOBILENO    , v_Emp_Mobileno)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0103;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0103 (
            SALES_OFFICE_ID,
            EMP_ID,
            REGION_NO,
            CITY_NO,
            SALES_OFFICE_NAME,
            EMP_NAME,
            REGION_NAME,
            CITY_NAME,
            EMP_MOBILENO,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sales_Office_Id,
            v_Emp_Id,
            v_Region_No,
            v_City_No,
            v_Sales_Office_Nm,
            v_Emp_Name,
            v_Region_Name,
            v_City_Name,
            v_Emp_Mobileno,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0103;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0103
    SET    SALES_OFFICE_ID   = v_Sales_Office_Id,
           EMP_ID            = v_Emp_Id,
           REGION_NO         = v_Region_No,
           CITY_NO           = v_City_No,
           SALES_OFFICE_NAME = v_Sales_Office_Nm,
           EMP_NAME          = v_Emp_Name,
           REGION_NAME       = v_Region_Name,
           CITY_NAME         = v_City_Name,
           EMP_MOBILENO      = v_Emp_Mobileno,
           CHG_ID            = v_Reg_Id,
           CHG_DT            = SYSDATE
    WHERE  SALES_OFFICE_ID   = v_Sales_Office_Id
    AND    EMP_ID            = v_Emp_Id
    AND    REGION_NO         = v_Region_No
    AND    CITY_NO           = v_City_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0103;

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
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0103
    WHERE  SALES_OFFICE_ID = v_Sales_Office_Id
    AND    EMP_ID          = v_Emp_Id
    AND    REGION_NO       = v_Region_No
    AND    CITY_NO         = v_City_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '담당지구 코드', v_Sales_Office_Id);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '담당자 사번', v_Emp_Id);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '지역코드', v_Region_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '도시코드', v_City_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '등록자ID', v_Reg_Id);
                                                                                        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0103;

  /*****************************************************************************
  -- 인바운드 지역코드 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0103 (
    v_Comm_Dvsn         IN CHAR,                            /*처리구분(I,U,D)       */
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,  /*담당지구 코드         */
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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:담당지구 코드,담당자 사번,지역코드,도시코드, 등록자 ID
    IF (TRIM(v_Sales_Office_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Sales_Office_Id)) THEN
        v_Return_Message := '담당지구 코드('||v_Sales_Office_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Emp_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Emp_Id)) THEN
        v_Return_Message := '담당자 사번('||v_Emp_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Region_No) IS NULL) THEN
        v_Return_Message := '지역코드('||v_Region_No||') : 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_City_No) IS NULL) THEN
        v_Return_Message := '도시코드('||v_City_No||') : 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0103Count(v_Sales_Office_Id,v_Emp_Id,v_Region_No,v_City_No) THEN

        IF 0 != f_InsertRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                 v_Sales_Office_Nm, v_Emp_Name, v_Region_Name, v_City_Name,
                                 v_Emp_Mobileno, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '인바운드 지역코드 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                     v_Sales_Office_Nm, v_Emp_Name, v_Region_Name, v_City_Name,
                                     v_Emp_Mobileno, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '인바운드 지역코드 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '인바운드 지역코드 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.p_IUDRtcs0103(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.p_IUDRtcs0103(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0103;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SALES_OFFICE_ID,           /*담당지구 코드       */
            A.EMP_ID,                    /*담당자 사번         */
            A.REGION_NO,                 /*지역코드            */
            A.CITY_NO,                   /*도시코드            */
            A.SALES_OFFICE_NAME,         /*담당지구 명         */
            A.EMP_NAME,                  /*담당자명            */
            A.REGION_NAME,               /*지역명              */
            A.CITY_NAME,                 /*도시명              */
            A.EMP_MOBILENO,              /*담당자Mobile No     */
            A.REG_ID,                    /*등록자ID            */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자ID            */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0103 A
    WHERE   A.SALES_OFFICE_ID  = DECODE(v_Sales_Office_Id, NULL, A.SALES_OFFICE_ID , v_Sales_Office_Id)
    AND     A.EMP_ID           = DECODE(v_Emp_Id         , NULL, A.EMP_ID          , v_Emp_Id)
    AND     A.REGION_NO        = DECODE(v_Region_No      , NULL, A.REGION_NO       , v_Region_No)
    AND     A.CITY_NO          = DECODE(v_City_No        , NULL, A.CITY_NO         , v_City_No)
    AND     A.SALES_OFFICE_NAME = DECODE(v_Sales_Office_Nm, NULL, A.SALES_OFFICE_NAME, v_Sales_Office_Nm)
    AND     A.EMP_NAME         = DECODE(v_Emp_Name       , NULL, A.EMP_NAME        , v_Emp_Name)
    AND     A.REGION_NAME      = DECODE(v_Region_Name    , NULL, A.REGION_NAME     , v_Region_Name)
    AND     A.CITY_NAME        = DECODE(v_City_Name      , NULL, A.CITY_NAME       , v_City_Name)
    AND     A.EMP_MOBILENO     = DECODE(v_Emp_Mobileno   , NULL, A.EMP_MOBILENO    , v_Emp_Mobileno)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0103City;

  /*****************************************************************************
  -- 인바운드 지역코드- 도시 코드,명 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0103Region (
    Ref_Cursor  IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN  Ref_Cursor FOR      
    SELECT  REGION_NO AS CD,
            REGION_NAME AS CD_NM
    FROM    RTCS0103
    GROUP   BY REGION_NO, REGION_NAME
    ORDER   BY CD_NM;
    
  END p_sRtcs0103Region;

  /*****************************************************************************
  -- 인바운드 지역코드- 도시 코드,명 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0103City (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Region_No IN RTCS0103.REGION_NO%TYPE            /*지역코드              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CITY_NO      AS CD,
            CITY_NAME    AS CD_NM
    FROM    RTCS0103
    WHERE   REGION_NO = v_Region_No
    GROUP   BY CITY_NO, CITY_NAME
    ORDER BY CD_NM;
    
  END p_sRtcs0103City;
  
END Pkg_Rtcs0103;
/
