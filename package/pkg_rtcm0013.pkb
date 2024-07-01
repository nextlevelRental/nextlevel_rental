CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0013 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0013
   PURPOSE:   �޴�-���α׷� ���� ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �޴�-���α׷� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0013Count(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE         /*���α׷��ڵ�          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0013
    WHERE   MENU_CD = v_Menu_Cd
    AND     PRGM_CD = v_Prgm_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0013Count;

  /*****************************************************************************
  -- �޴�-���α׷� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0013 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE         /*�޴��ڵ�              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,     /*�޴��ڵ�              */
            A.PRGM_CD,     /*���α׷��ڵ�          */
            A.SORT_ODR,    /*���ļ���              */
            A.REG_ID,      /*�����ID              */
            A.REG_DT,      /*�����                */
            A.CHG_ID,      /*������ID              */
            A.CHG_DT       /*������                */
    FROM    RTCM0013 A
    WHERE   A.MENU_CD = v_Menu_Cd
    ORDER   BY SORT_ODR;
    
  END p_sRtcm0013;

  /*****************************************************************************
  -- �޴�-���α׷� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    INSERT  INTO RTCM0013 (
            MENU_CD,
            PRGM_CD,
            SORT_ODR,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Menu_Cd,
            v_Prgm_Cd,
            v_Sort_Odr,
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
        
  END f_InsertRTCM0013;


  /*****************************************************************************
  -- �޴�-���α׷� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0013
    SET    SORT_ODR = V_Sort_Odr,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  MENU_CD  = V_Menu_Cd
    AND    PRGM_CD  = V_Prgm_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0013;
  
  /*****************************************************************************
  -- �޴�-���α׷� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    DELETE RTCM0013
    WHERE  MENU_CD  = V_Menu_Cd
    AND    PRGM_CD  = V_Prgm_Cd;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0013.f_DeleteRtcm0013(1)', '�޴��ڵ�|���α׷��ڵ�|�����ID', v_Menu_Cd, v_Prgm_Cd, v_Reg_Id);
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0013;

  
  /*****************************************************************************
  -- �޴�-���α׷� ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0013(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- �ʼ���: �޴��ڵ�, ���α׷��ڵ�, �����ID
    IF (TRIM(v_Menu_Cd) IS NULL) OR (0 = Pkg_Rtcm0012.f_sRtcm0012Count(v_Menu_Cd)) THEN
        v_Return_Message := '�޴��ڵ�('||v_Menu_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Prgm_Cd) IS NULL) OR (0 = Pkg_Rtcm0011.f_sRtcm0011Count(v_Prgm_Cd)) THEN
        v_Return_Message := '���α׷��ڵ�('||v_Prgm_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    
    IF 0 = f_sRtcm0013Count(v_Menu_Cd, v_Prgm_Cd) THEN

        IF 0 != f_InsertRtcm0013(v_Menu_Cd, v_Prgm_Cd, v_Sort_Odr, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�޴�-���α׷� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;    
                            
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0013(v_Menu_Cd, v_Prgm_Cd, v_Sort_Odr, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�޴�-���α׷� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0013(v_Menu_Cd, v_Prgm_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�޴�-���α׷� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := ' ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0013.p_IUDRTCM0013(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0013.p_IUDRTCM0013(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0013;
  


  /*****************************************************************************
  --  �޴�-���α׷� ���� - �ش� �޴��� �Ҽӵ� ���α׷� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0013MenuProgram (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE         /*�޴��ڵ�              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PRGM_CD,    /*���α׷��ڵ�          */
            A.PRGM_NM,    /*���α׷���            */
            B.SORT_ODR,   /*���ļ���              */
            A.PRGM_PATH,  /*���α׷����          */
            A.PRGM_DESC,  /*���α׷�����          */
            A.MDL_CD,     /*����ڵ�              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*���� */
            A.USE_YN,     /*��뿩��              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ� */
            A.REG_ID,     /*����� ID             */
            A.REG_DT,     /*�����                */
            A.CHG_ID,     /*������ID              */
            A.CHG_DT      /*������                */
    FROM    RTCM0011 A,
            RTCM0013 B
    WHERE   A.USE_YN = 'Y'
    AND     A.PRGM_CD = B.PRGM_CD
    AND     B.MENU_CD = v_Menu_Cd
    ORDER   BY B.SORT_ODR;
    
    
  END p_sRtcm0013MenuProgram;
  
  /*****************************************************************************
  -- �޴�-���α׷� ���� - �ش� �޴��� �Ҽӵ��� ���� ���α׷� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0013MenuProgramNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE         /*���α׷���            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PRGM_CD,    /*���α׷��ڵ�          */
            A.PRGM_NM,    /*���α׷���            */
            A.PRGM_PATH,  /*���α׷����          */
            A.PRGM_DESC,  /*���α׷�����          */
            A.MDL_CD,     /*����ڵ�              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*���� */
            A.USE_YN,     /*��뿩��              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ� */
            A.REG_ID,     /*����� ID             */
            A.REG_DT,     /*�����                */
            A.CHG_ID,     /*������ID              */
            A.CHG_DT      /*������                */
    FROM    RTCM0011 A
    WHERE   A.USE_YN = 'Y'
    AND     A.PRGM_CD LIKE v_Prgm_Cd||'%'
    AND     A.PRGM_NM LIKE '%'||v_Prgm_Nm||'%'
    AND     A.PRGM_CD NOT IN (SELECT B.PRGM_CD
                              FROM   RTCM0013 B
                              WHERE  B.MENU_CD = v_Menu_Cd)
    ORDER   BY A.MDL_CD,A.PRGM_CD;
    
    
  END p_sRtcm0013MenuProgramNot;
    
END Pkg_Rtcm0013;
/
