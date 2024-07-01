CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0021 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0021
   PURPOSE:  �Ǹ���ǰ����  
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-22  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �Ǹ�����ǰ(Ÿ�̾�) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* �Ǹ��ڵ�  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* ��ǰ����  */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.SALE_CD,     /* �Ǹ��ڵ�                 */
            A.SALE_GDS_CD, /* Ÿ�̾��� ��� �����ڵ�, ������ ��� ����, �ΰ���ǰ�� ��� �ΰ���ǰ�ڵ�  */
            A.GDS_GB,      /* ��ǰ����                 */
            A.GDS_GRP,     /* ��ǰ��                   */
            A.REG_DT,      /* �����                   */
            A.REG_ID,      /* ����� ID                */
            A.CHG_ID,      /* ������ ID                */
            A.CHG_DT       /* ������                   */
    FROM    RTSD0021    A
    WHERE   A.SALE_CD = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd)
    AND     A.GDS_GB  = DECODE(v_Gds_Gb, NULL, A.GDS_GB, v_Gds_Gb)
    ORDER BY A.SALE_GDS_CD;
  END p_sRtsd0021;

  /*****************************************************************************
  -- �Ǹźΰ���ǰ(���ջ�ǰ) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021SaleProd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* �Ǹ��ڵ�  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* ��ǰ����  */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT
     T.SALE_CD,                                     /* �Ǹ��ڵ�      */   
     T1.ADD_GDS_CD,                                 /* �ΰ���ǰ�ڵ�  */
     T1.ADD_GDS_NM,                                 /* �ΰ���ǰ��    */
     NVL(T1.AMT,0) AS AMT,                          /* �ݾ�          */
     T1.MAKER_NM,                                   /* ������        */
     T1.GDS_GB,                                     /* ��ǰ����      */
     T1.GDS_DESC,                                   /* ��ǰ����      */
     T1.GDS_DESC_DT,                                /* ��ǰ�󼼼���  */
     T1.REG_ID,                                     /* ����� ID     */
     T1.REG_DT,                                     /* �����        */
     T1.CHG_ID,                                     /* ������ ID     */
     T1.CHG_DT,                                     /* ������        */
     T1.GDS_GRP,                                    /* ��ǰ��        */
     T1.USE_YN,                                     /* ��뿩��      */
     NVL(T1.DC_AMT,0) AS DC_AMT,                    /* ���αݾ�      */
     NVL(T1.AMT, 0) - NVL(T1.DC_AMT, 0) AS ACT_AMT, /* ���Ǹűݾ�    */
     T1.DC_YN                                       /* �Һο���     */
    FROM RTSD0021 T, RTSD0023 T1
    WHERE T.SALE_GDS_CD = T1.ADD_GDS_CD
    AND   T.SALE_CD = DECODE(v_Sale_Cd, NULL, T.SALE_CD, v_Sale_Cd)
    AND   T.GDS_GB  = DECODE(v_Gds_Gb, NULL, T.GDS_GB, v_Gds_Gb)
    ORDER BY T.SALE_GDS_CD;
  END p_sRtsd0021SaleProd;

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
    ) RETURN NUMBER IS
  BEGIN
    
    INSERT  INTO RTSD0021 (
            SALE_CD,
            SALE_GDS_CD,
            GDS_GB,
            GDS_GRP,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sale_Cd,
            v_Sale_Gds_Cd,
            v_Gds_Gb,
            v_Gds_Grp,
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

  END f_InsertRtsd0021;

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
    ) RETURN NUMBER IS
  BEGIN
    
    UPDATE RTSD0021
    SET    GDS_GRP      = v_Gds_Grp,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  SALE_CD      = v_Sale_Cd
    AND    SALE_GDS_CD  = v_Sale_Gds_Cd
    AND    GDS_GB       = v_Gds_Gb;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0021;


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
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0021
    WHERE  SALE_CD      = v_Sale_Cd
    AND    SALE_GDS_CD  = v_Sale_Gds_Cd
    AND    GDS_GB       = v_Gds_Gb;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0021;


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
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0021(v_Sale_Cd, v_Sale_Gds_Cd, v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�Ǹ���ǰ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
       
        
    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRtsd0021(v_Sale_Cd, v_Sale_Gds_Cd, v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�Ǹ���ǰ���� ���� ����!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSIF v_Comm_Dvsn = 'D' THEN
        
        IF 0 != f_DeleteRtsd0021(v_Sale_Cd, v_Sale_Gds_Cd, v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�Ǹ���ǰ���� ���� ����!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_IUDRtsd0021(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_IUDRtsd0021(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0021; 

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
    ) IS
  
    e_Error EXCEPTION;
    
  BEGIN
        
    DELETE FROM RTSD0021
    WHERE  SALE_CD      = v_Sale_Cd
    AND    GDS_GB       = v_Gds_Gb;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_UpdateRtsd0021DeleteGdsGb(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_UpdateRtsd0021DeleteGdsGb(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0021DeleteGdsGb;
  
END Pkg_Rtsd0021;
/
