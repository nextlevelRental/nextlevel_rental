CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0025 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0025
   PURPOSE:   �޴�-���ѱ׷� ���� ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0025Count(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0025
    WHERE   MENU_CD     = v_Menu_Cd
    AND     AUTH_GRP_CD = v_Auth_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0025Count;

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0025 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,       /*�޴��ڵ�              */
            A.AUTH_GRP_CD,   /*���ѱ׷��ڵ�          */
            A.REG_ID,        /*����� ID             */
            A.REG_DT,        /*�����                */
            A.CHG_ID,        /*������ ID             */
            A.CHG_DT         /*������                */
    FROM    RTCM0025 A
    WHERE   A.MENU_CD     = DECODE(v_Menu_Cd, NULL, A.MENU_CD, v_Menu_Cd)
    AND     A.AUTH_GRP_CD = DECODE(v_Auth_Grp_Cd, NULL, A.AUTH_GRP_CD, v_Auth_Grp_Cd);
    
  END p_sRtcm0025;

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    INSERT  INTO RTCM0025 (
            MENU_CD,
            AUTH_GRP_CD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Menu_Cd,
            v_Auth_Grp_Cd,
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
        
  END f_InsertRTCM0025;


  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
    UPDATE RTCM0025
    SET    MENU_CD      = V_Menu_Cd,
           AUTH_GRP_CD  = V_Auth_Grp_Cd,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  MENU_CD      = V_Menu_Cd
    AND    AUTH_GRP_CD  = V_Auth_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0025;
  
  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    DELETE RTCM0025
    WHERE  MENU_CD      = V_Menu_Cd
    AND    AUTH_GRP_CD  = V_Auth_Grp_Cd;

    Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0025.f_DeleteRtcm0025(1)', '�޴��ڵ�|���ѱ׷��ڵ�|����� ID', v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id);        

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0025;

  
  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0025(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- �ʼ���: �޴��ڵ�, ���ѱ׷��ڵ�, ����� ID
    IF (TRIM(v_Menu_Cd) IS NULL) OR (0 = Pkg_Rtcm0012.f_sRtcm0012Count(v_Menu_Cd)) THEN
        v_Return_Message := '�޴��ڵ�('||v_Menu_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Auth_Grp_Cd) IS NULL) OR (0 = Pkg_Rtcm0021.f_sRtcm0021Count(v_Auth_Grp_Cd)) THEN
        v_Return_Message := '���ѱ׷��ڵ�('||v_Auth_Grp_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0025Count(v_Menu_Cd, v_Auth_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0025(v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�޴�-���ѱ׷� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;   
                             
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0025(v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�޴�-���ѱ׷� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0025(v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�޴�-���ѱ׷� ���� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0025.p_IUDRTCM0025(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0025.p_IUDRTCM0025(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0025;



  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� - �ش� ���ѱ׷쿡 �Ҽӵ� �޴� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenu (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,       /*�޴��ڵ�              */
            A.MENU_NM,       /*�޴���                */
            A.MENU_LVL,      /*�޴�����              */
            A.UPR_MENU_CD,   /*�����޴��ڵ�          */
            B.MENU_NM UP_MENU_NM, /*�����޴���       */
            A.MDL_CD,        /*����ڵ�              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM,    /*����         */
            A.SORT_ODR,      /*���ļ���              */
            A.MENU_DESC,     /*�޴�����              */
            A.USE_YN,        /*��뿩��              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,        /*����� ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,              /*����ڸ�       */
            A.REG_DT,        /*�����                */
            A.CHG_ID,        /*������ ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,              /*�����ڸ�       */
            A.CHG_DT         /*������                */
    FROM    RTCM0012 A,
            RTCM0012 B
    WHERE   A.MENU_CD IN (  SELECT  C25.MENU_CD
                            FROM    RTCM0025 C25
                            WHERE   C25.AUTH_GRP_CD = v_Auth_Grp_Cd)
    AND     A.UPR_MENU_CD = B.MENU_CD(+)
    ORDER   BY A.MENU_LVL, A.MDL_CD, A.SORT_ODR;
    
    
  END p_sRtcm0025AuthGroupMenu;
  
  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� - �ش� ���ѱ׷쿡 �Ҽӵ��� ���� �޴� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenuNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE         /*�޴���                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,       /*�޴��ڵ�              */
            A.MENU_NM,       /*�޴���                */
            A.MENU_LVL,      /*�޴�����              */
            A.UPR_MENU_CD,   /*�����޴��ڵ�          */
            B.MENU_NM UP_MENU_NM, /*�����޴���       */
            A.MDL_CD,        /*����ڵ�              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM,    /*����         */
            A.SORT_ODR,      /*���ļ���              */
            A.MENU_DESC,     /*�޴�����              */
            A.USE_YN,        /*��뿩��              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,        /*����� ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,              /*����ڸ�       */
            A.REG_DT,        /*�����                */
            A.CHG_ID,        /*������ ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,              /*�����ڸ�       */
            A.CHG_DT         /*������                */
    FROM    RTCM0012 A,
            RTCM0012 B
    WHERE   A.MENU_CD NOT IN (  SELECT  C25.MENU_CD
                                FROM    RTCM0025 C25
                                WHERE   C25.AUTH_GRP_CD = v_Auth_Grp_Cd)
    AND     A.UPR_MENU_CD = B.MENU_CD(+)    
    AND     A.MENU_CD LIKE v_Menu_Cd||'%'
    AND     A.MENU_NM LIKE '%'||v_Menu_Nm||'%' 
    ORDER   BY A.MENU_LVL, A.MDL_CD, A.SORT_ODR;
    
    
  END p_sRtcm0025AuthGroupMenuNot;
    
END Pkg_Rtcm0025;
/
