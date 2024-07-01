CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0012 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0012
   PURPOSE:   �޴� Master ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �޴� Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0012Count(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*�޴��ڵ�              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0012
    WHERE   MENU_CD = v_Menu_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0012Count;

  /*****************************************************************************
  -- �޴� Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0012 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE     /*�����޴��ڵ�          */
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
    WHERE   A.MENU_CD = DECODE(v_Menu_Cd, NULL, A.MENU_CD, v_Menu_Cd)
    AND     A.MENU_NM LIKE '%'||v_Menu_Nm||'%'
    AND     A.UPR_MENU_CD = DECODE(v_Upr_Menu_Cd, NULL, A.UPR_MENU_CD, v_Upr_Menu_Cd)
    AND     A.UPR_MENU_CD = B.MENU_CD(+)
    ORDER   BY A.MDL_CD, A.SORT_ODR;
    
  END p_sRtcm0012;

  /*****************************************************************************
  -- �޴� Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*�޴�����              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*�����޴��ڵ�          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*����ڵ�              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*���ļ���              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*�޴�����              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    INSERT  INTO RTCM0012 (
            MENU_CD,
            MENU_NM,
            MENU_LVL,
            UPR_MENU_CD,
            MDL_CD,
            SORT_ODR,
            MENU_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Menu_Cd,
            v_Menu_Nm,
            v_Menu_Lvl,
            DECODE(V_Menu_Lvl,1,' ', V_Upr_Menu_Cd), -- V_Upr_Menu_Cd �ε����� ����ϱ� ���� �ֻ����޴��� ' '���� ó��
            v_Mdl_Cd,
            v_Sort_Odr,
            v_Menu_Desc,
            v_Use_Yn,
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
        
  END f_InsertRTCM0012;


  /*****************************************************************************
  -- �޴� Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*�޴�����              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*�����޴��ڵ�          */    
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*����ڵ�              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*���ļ���              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*�޴�����              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS    

  BEGIN

    UPDATE RTCM0012
    SET    MENU_CD      = V_Menu_Cd,
           MENU_NM      = V_Menu_Nm,
           MENU_LVL     = V_Menu_Lvl,
           UPR_MENU_CD  = DECODE(V_Menu_Lvl,1,' ', V_Upr_Menu_Cd), -- V_Upr_Menu_Cd �ε����� ����ϱ� ���� �ֻ����޴��� ' '���� ó��
           MDL_CD       = v_Mdl_Cd,
           SORT_ODR     = v_Sort_Odr,
           MENU_DESC    = V_Menu_Desc,
           USE_YN       = V_Use_Yn,
           REG_ID       = V_Reg_Id,
           REG_DT       = SYSDATE,
           CHG_ID       = V_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  MENU_CD      = V_Menu_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0012;
  
  /*****************************************************************************
  -- �޴� Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0012
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  MENU_CD = v_Menu_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0012;

  
  /*****************************************************************************
  -- �޴� Master ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0012(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*�޴�����              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*�����޴��ڵ�          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*����ڵ�              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*���ļ���              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*�޴�����              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- �ʼ���: ���α׷� �ڵ�, ���α׷� ��, ���α׷� URL, ���α׷� ����, ����ڵ� , �������, ����� ID
    IF TRIM(v_Menu_Cd) IS NULL THEN
        v_Return_Message := '�޴��ڵ�('||v_Menu_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Menu_Nm) IS NULL THEN
        v_Return_Message := '�޴���('||v_Menu_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Menu_Lvl) IS NULL THEN
        v_Return_Message := '�޴�����('||(v_Menu_Lvl)||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (v_Menu_Lvl <> 1) AND (TRIM(v_Upr_Menu_Cd) IS NULL) THEN
        v_Return_Message := '�ֻ��� �޴��� �����ϰ�� �����޴�('||(v_Upr_Menu_Cd)||')�ʼ� �Է��׸��Դϴ�. ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;        
        
    IF (TRIM(v_Mdl_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C003', v_Mdl_Cd)) THEN
        v_Return_Message := '����ڵ�('||v_Mdl_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0012Count(v_Menu_Cd) THEN

        IF 0 != f_InsertRtcm0012(v_Menu_Cd, v_Menu_Nm, v_Menu_Lvl, v_Upr_Menu_Cd, 
                                 v_Mdl_Cd, v_Sort_Odr, v_Menu_Desc, v_Use_Yn, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�޴� Master ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;      
                          
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0012(v_Menu_Cd, v_Menu_Nm, v_Menu_Lvl, v_Upr_Menu_Cd, 
                                     v_Mdl_Cd, v_Sort_Odr, v_Menu_Desc, v_Use_Yn, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�޴� Master ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0012(v_Menu_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�޴� Master ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0012.p_IUDRTCM0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0012.p_IUDRTCM0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0012;

  /*****************************************************************************
  -- �޴� Master - �޴��ڵ�� �޴��� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0012MenuName(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*�޴��ڵ�              */
    ) RETURN VARCHAR IS
    v_Menu_Nm        RTCM0012.MENU_NM%TYPE;           /*�޴��ڵ�              */
  BEGIN

    SELECT  MENU_NM
    INTO    v_Menu_Nm
    FROM    RTCM0012
    WHERE   MENU_CD = v_Menu_Cd;

    RETURN v_Menu_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0012MenuName;

  /*****************************************************************************
  -- �޴� Master - �޴�TREE ������ ���� ��ü �޴����� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0012Tree (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM ROW_SEQ,
            A.MENU_CD,       /*�޴��ڵ�              */
            A.MENU_NM,       /*�޴���                */
            A.MENU_LVL,      /*�޴�����              */
            A.UPR_MENU_CD,   /*�����޴��ڵ�          */
            Pkg_Rtcm0012.f_sRtcm0012MenuName(A.UPR_MENU_CD) UPR_MENU_NM, /*�����޴���          */
            A.MDL_CD,        /*����ڵ�              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*���� */
            A.SORT_ODR,      /*���ļ���              */
            A.MENU_DESC,     /*�޴�����              */
            A.USE_YN         /*��뿩��              */
    FROM    RTCM0012 A
    START   WITH A.UPR_MENU_CD = ' '
    CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
    AND     A.USE_YN = 'Y'
    ORDER   SIBLINGS BY A.SORT_ODR; 
    
  END p_sRtcm0012Tree;


  /*****************************************************************************
  -- �޴� Master -  �޴�- ���α׷�  Ʈ�� ����
  *****************************************************************************/
  PROCEDURE p_sRtcm0012TreeProgram (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  A.MENU_TYPE,                                
            A.MENU_CD,       /*�޴��ڵ�              */ 
            A.MENU_NM,       /*�޴���                */ 
            A.MENU_LVL,      /*�޴�����              */ 
            A.UPR_MENU_CD,   /*�����޴��ڵ�          */ 
            A.MDL_CD,        /*����ڵ�              */ 
            A.SORT_ODR,      /*���ļ���              */ 
            A.MENU_DESC,     /*�޴�����              */ 
            A.USE_YN         /*��뿩��              */ 
    FROM    (
            SELECT  'M' MENU_TYPE,
                    C12.MENU_CD,       /*�޴��ڵ�              */
                    C12.MENU_NM,       /*�޴���                */
                    C12.MENU_LVL,      /*�޴�����              */
                    C12.UPR_MENU_CD,   /*�����޴��ڵ�          */
                    C12.MDL_CD,        /*����ڵ�              */
                    C12.SORT_ODR,      /*���ļ���              */
                    C12.MENU_DESC,     /*�޴�����              */
                    C12.USE_YN         /*��뿩��              */
            FROM    RTCM0012 C12
            UNION   ALL
            SELECT  'P' MENU_TYPE,
                    C13.PRGM_CD MENU_CD,
                    C11.PRGM_NM MENU_NM,
                    C12.MENU_LVL+1 MENU_LVL,
                    C13.MENU_CD UPR_MENU_CD, 
                    C12.MDL_CD,
                    C13.SORT_ODR,
                    C11.PRGM_DESC MENU_DESC,
                    C12.USE_YN
            FROM    RTCM0013 C13,
                    RTCM0012 C12,
                    RTCM0011 C11
            WHERE   C13.MENU_CD = C12.MENU_CD
            AND     C13.PRGM_CD = C11.PRGM_CD
            ) A
    START   WITH A.UPR_MENU_CD = ' '
    CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
    AND     A.USE_YN = 'Y'
    ORDER   SIBLINGS BY A.SORT_ODR; 
    
  END p_sRtcm0012TreeProgram;


  /*****************************************************************************
  -- �޴� Master - Ư�� �������  �޴� Ʈ�� ����
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTree (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*����� ���̵�       */    
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM ROW_SEQ,
            A.MENU_CD,       /*�޴��ڵ�              */
            A.MENU_NM,       /*�޴���                */
            A.MENU_LVL,      /*�޴�����              */
            A.UPR_MENU_CD,   /*�����޴��ڵ�          */
            Pkg_Rtcm0012.f_sRtcm0012MenuName(A.UPR_MENU_CD) UPR_MENU_NM, /*�����޴���          */
            A.MDL_CD,        /*����ڵ�              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*���� */
            A.SORT_ODR,      /*���ļ���              */
            A.MENU_DESC,     /*�޴�����              */
            A.USE_YN         /*��뿩��              */
    FROM    RTCM0012 A
    WHERE   A.MENU_CD IN (-- ������� ���ѱ׷캰 �޴� ����Ʈ(�ߺ�����)
                            SELECT  DISTINCT C25.MENU_CD
                            FROM    RTCM0023 C23,
                                    RTCM0025 C25,
                                    RTCM0021 C21
                            WHERE   C23.USER_ID = v_User_Id
                            AND     C23.DEL_FG = 'N'
                            AND     C23.AUTH_GRP_CD = C25.AUTH_GRP_CD
                            AND     C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
                            AND     C21.USE_YN = 'Y'
                            )
    START   WITH A.UPR_MENU_CD = ' '
    CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
    AND     A.USE_YN = 'Y'
    ORDER   SIBLINGS BY A.SORT_ODR;
    
  END p_sRtcm0012UserTree;  
  
  /*****************************************************************************
  -- �޴� Master -  Ư�� �������  �޴�- ���α׷� - ������  Ʈ�� ����
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTreeAuth (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,          /*����� ���̵�       */
    v_Local_Ip       IN VARCHAR2                        /*����PC IP           */
    ) IS

    v_ErrorText      VARCHAR2(2000);
    
    v_Fail_Cnt       RTCM0001.FAIL_CNT%TYPE;
    
  BEGIN


    OPEN Ref_Cursor FOR
    WITH R_MENU_CD AS (
        SELECT C13.MENU_CD
               FROM RTCM0023 C23,
                    RTCM0021 C21,
                    RTCM0024 C24,
                    RTCM0013 C13
                    WHERE     C23.USER_ID = v_User_Id
                    AND C23.DEL_FG = 'N'
                    AND C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
                    AND C21.USE_YN = 'Y'
                    AND C23.AUTH_GRP_CD = C24.AUTH_GRP_CD
                    AND C24.PRGM_CD = C13.PRGM_CD
                    GROUP BY C13.MENU_CD
    )
    SELECT  A.ROW_SEQ,         /*����                  */
            A.MENU_TYPE,       /*�޴�_���α׷�����     */
            A.MENU_CD,         /*�޴��ڵ�              */
            A.MENU_NM,         /*�޴���                */
            A.MENU_LVL,        /*�޴�����              */
            A.UPR_MENU_CD,     /*�����޴��ڵ�          */
            A.MENU_CD_TOP,     /*�ֻ����޴��ڵ�        */
            LOWER(A.MDL_CD) MDL_CD, /*����ڵ�              */
            A.SORT_ODR,        /*���ļ���              */
            A.MENU_DESC,       /*�޴�����              */
            A.USE_YN,          /*��뿩��              */
            A.PRGM_PATH,       /*���α׷����          */
            B.USER_ID,         /*����ھ��̵�          */
            B.PRGM_CD,         /*���α׷��ڵ�          */
            B.READ_AUTH_YN,    /*�б���� ����         */
            B.SAVE_AUTH_YN,    /*������ѿ���          */
            B.DEL_AUTH_YN,     /*�������ѿ���          */
            B.PRNT_AUTH_YN,    /*�μ���ѿ���          */
            B.EXPT_AUTH_YN,    /*����������ѿ���      */
            B.CHG_AUTH_YN,     /*�����������ѿ���      */
            B.ETC1_AUTH_YN,    /*��Ÿ ����1            */
            B.ETC2_AUTH_YN,    /*��Ÿ ����2            */
            B.ETC3_AUTH_YN     /*��Ÿ ����3            */
    FROM    (
            SELECT  ROWNUM ROW_SEQ,
                    CONNECT_BY_ROOT(A.MENU_CD) MENU_CD_TOP,
                    A.*
            FROM    (
                    SELECT  'M' MENU_TYPE,               /*�޴�_���α׷�����     */
                            C12.MENU_CD,                 /*�޴��ڵ�              */
                            C12.MENU_NM,                 /*�޴���                */
                            C12.MENU_LVL,                /*�޴�����              */
                            C12.UPR_MENU_CD,             /*�����޴��ڵ�          */
                            C12.MDL_CD,                  /*����ڵ�              */
                            C12.SORT_ODR,                /*���ļ���              */
                            C12.MENU_DESC,               /*�޴�����              */
                            C12.USE_YN,                  /*��뿩��              */
                            '' PRGM_PATH                 /*���α׷����          */
                    FROM    RTCM0012 C12
                    WHERE   C12.MENU_CD IN (SELECT  MENU_CD
                                            FROM    RTCM0012 C13
                                            START   WITH C13.MENU_CD IN (SELECT * FROM R_MENU_CD)
                                            CONNECT BY  PRIOR C13.UPR_MENU_CD = C13.MENU_CD )  
                    UNION   ALL
                    SELECT  'P' MENU_TYPE,               /*�޴�_���α׷�����     */
                            C13.PRGM_CD MENU_CD,         /*�޴��ڵ�              */
                            C11.PRGM_NM MENU_NM,         /*�޴���                */
                            C12.MENU_LVL+1 MENU_LVL,     /*�޴�����              */
                            C13.MENU_CD UPR_MENU_CD,     /*�����޴��ڵ�          */
                            C12.MDL_CD,                  /*����ڵ�              */
                            C13.SORT_ODR,                /*���ļ���              */
                            C11.PRGM_DESC MENU_DESC,     /*�޴�����              */
                            C11.USE_YN,                  /*��뿩��              */
                            C11.PRGM_PATH                /*���α׷����          */
                    FROM    RTCM0013 C13,
                            RTCM0012 C12,
                            RTCM0011 C11
                    WHERE   C13.MENU_CD = C12.MENU_CD
                    AND     C13.PRGM_CD = C11.PRGM_CD
                    AND     C13.MENU_CD IN (SELECT  MENU_CD
                                            FROM    RTCM0012 C13
                                            START   WITH C13.MENU_CD IN (SELECT * FROM R_MENU_CD)
                                            CONNECT BY  PRIOR C13.UPR_MENU_CD = C13.MENU_CD )  
                    ) A
            START   WITH A.UPR_MENU_CD = ' '
            CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
            AND     A.USE_YN = 'Y'
            ORDER   SIBLINGS BY A.SORT_ODR
            ) A,
            (
            SELECT  C23.USER_ID,                         /*����ھ��̵�          */
                    C24.PRGM_CD,                         /*���α׷��ڵ�          */
                    MAX(C24.READ_AUTH_YN) READ_AUTH_YN,  /*�б���� ����         */
                    MAX(C24.SAVE_AUTH_YN) SAVE_AUTH_YN,  /*������ѿ���          */
                    MAX(C24.DEL_AUTH_YN ) DEL_AUTH_YN ,  /*�������ѿ���          */
                    MAX(C24.PRNT_AUTH_YN) PRNT_AUTH_YN,  /*�μ���ѿ���          */
                    MAX(C24.EXPT_AUTH_YN) EXPT_AUTH_YN,  /*����������ѿ���      */
                    MAX(C24.CHG_AUTH_YN ) CHG_AUTH_YN ,  /*�����������ѿ���      */
                    MAX(C24.ETC1_AUTH_YN) ETC1_AUTH_YN,  /*��Ÿ ����1            */
                    MAX(C24.ETC2_AUTH_YN) ETC2_AUTH_YN,  /*��Ÿ ����2            */
                    MAX(C24.ETC3_AUTH_YN) ETC3_AUTH_YN   /*��Ÿ ����3            */
            FROM    RTCM0023 C23,
                    RTCM0021 C21,
                    RTCM0024 C24
            WHERE   C23.USER_ID = v_User_Id
            AND     C23.DEL_FG  = 'N'
            AND     C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
            AND     C21.USE_YN = 'Y'
            AND     C23.AUTH_GRP_CD = C24.AUTH_GRP_CD
            GROUP   BY C23.USER_ID, C24.PRGM_CD
            ) B
    WHERE   A.MENU_CD = B.PRGM_CD(+)
    AND     NOT (A.MENU_TYPE = 'P' AND USER_ID IS NULL)
    ORDER BY A.ROW_SEQ;

    -- ����ں� �޴����� ���ν���(p_sRtcm0012UserTreeAuth)��  �α��� ������ ȣ��Ǵ� ���ν����� ���� ���� ���� ������Ʈ
    
    SELECT  FAIL_CNT
      INTO  v_Fail_Cnt
      FROM  RTCM0001
     WHERE  USER_ID = v_User_Id;

    IF v_Fail_Cnt <= 5 THEN
        -- �����������ȸ ���ν���(p_sRtcm0001LoginInfo)���� ���� ���� �Ǽ��� +1 �س���, �α��� ������ 0���� �ʱ�ȭ
        IF 0 != Pkg_Rtcm0001.f_UpdateRtcm0001FailCntInit(v_User_Id, v_ErrorText) THEN
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0012.p_sRtcm0012UserTreeAuth(2)', '���� ���� �Ǽ� �ʱ�ȭ ����!!!', v_User_Id, v_ErrorText);
        END IF;
    END IF;

    -- ����� ���̵�� ���� IP ������ ���� ���̵� ������� ���� ���˽� ����ϱ� ���� �α� ����
    --Pkg_Utility.p_LoginFileWrite('Pkg_Rtcm0012.p_sRtcm0012UserTreeAuth(1)', 'v_User_Id', v_User_Id, 'v_Local_Ip', v_Local_Ip);



  END p_sRtcm0012UserTreeAuth;
    
END Pkg_Rtcm0012;
/
