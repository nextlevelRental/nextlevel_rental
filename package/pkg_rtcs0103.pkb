CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0103 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0103
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SALES_OFFICE_ID,           /*������� �ڵ�       */
            A.EMP_ID,                    /*����� ���         */
            A.REGION_NO,                 /*�����ڵ�            */
            A.CITY_NO,                   /*�����ڵ�            */
            A.SALES_OFFICE_NAME,         /*������� ��         */
            A.EMP_NAME,                  /*����ڸ�            */
            A.REGION_NAME,               /*������              */
            A.CITY_NAME,                 /*���ø�              */
            A.EMP_MOBILENO,              /*�����Mobile No     */
            A.REG_ID,                    /*�����ID            */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ID            */
            A.CHG_DT                     /*������              */
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
  -- �ιٿ�� �����ڵ� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*�����ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0103
    WHERE  SALES_OFFICE_ID = v_Sales_Office_Id
    AND    EMP_ID          = v_Emp_Id
    AND    REGION_NO       = v_Region_No
    AND    CITY_NO         = v_City_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '������� �ڵ�', v_Sales_Office_Id);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '����� ���', v_Emp_Id);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '�����ڵ�', v_Region_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '�����ڵ�', v_City_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.f_DeleteRtcs0103(1)', '�����ID', v_Reg_Id);
                                                                                        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0103;

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0103 (
    v_Comm_Dvsn         IN CHAR,                            /*ó������(I,U,D)       */
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,  /*������� �ڵ�         */
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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:������� �ڵ�,����� ���,�����ڵ�,�����ڵ�, ����� ID
    IF (TRIM(v_Sales_Office_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Sales_Office_Id)) THEN
        v_Return_Message := '������� �ڵ�('||v_Sales_Office_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Emp_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Emp_Id)) THEN
        v_Return_Message := '����� ���('||v_Emp_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Region_No) IS NULL) THEN
        v_Return_Message := '�����ڵ�('||v_Region_No||') : �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_City_No) IS NULL) THEN
        v_Return_Message := '�����ڵ�('||v_City_No||') : �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0103Count(v_Sales_Office_Id,v_Emp_Id,v_Region_No,v_City_No) THEN

        IF 0 != f_InsertRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                 v_Sales_Office_Nm, v_Emp_Name, v_Region_Name, v_City_Name,
                                 v_Emp_Mobileno, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�ιٿ�� �����ڵ� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                     v_Sales_Office_Nm, v_Emp_Name, v_Region_Name, v_City_Name,
                                     v_Emp_Mobileno, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�ιٿ�� �����ڵ� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�ιٿ�� �����ڵ� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0103.p_IUDRtcs0103(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0103;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SALES_OFFICE_ID,           /*������� �ڵ�       */
            A.EMP_ID,                    /*����� ���         */
            A.REGION_NO,                 /*�����ڵ�            */
            A.CITY_NO,                   /*�����ڵ�            */
            A.SALES_OFFICE_NAME,         /*������� ��         */
            A.EMP_NAME,                  /*����ڸ�            */
            A.REGION_NAME,               /*������              */
            A.CITY_NAME,                 /*���ø�              */
            A.EMP_MOBILENO,              /*�����Mobile No     */
            A.REG_ID,                    /*�����ID            */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ID            */
            A.CHG_DT                     /*������              */
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
  -- �ιٿ�� �����ڵ�- ���� �ڵ�,�� ��ȸ
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
  -- �ιٿ�� �����ڵ�- ���� �ڵ�,�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0103City (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Region_No IN RTCS0103.REGION_NO%TYPE            /*�����ڵ�              */
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
