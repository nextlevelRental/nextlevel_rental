CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0050 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0050
   PURPOSE:   �����ڵ� Head ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Head Count
  *****************************************************************************/
  FUNCTION f_sRtcm0050Count(
    v_Cd_Grp_Cd    IN     RTCM0050.CD_GRP_CD%TYPE           /*�ڵ�׷��ڵ�    */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0050
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0050Count;

  /*****************************************************************************
  -- �����ڵ� Head Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0050 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*�ڵ�׷��ڵ�        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*�ڵ�׷��          */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,      /*�ڵ�׷��ڵ�          */
            A.CD_GRP_NM,      /*�ڵ�׷��            */
            A.CD_GRP_DESC,    /*�ڵ�׷켳��          */
            A.MDL_CD,         /*��ⱸ��              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM,    /*����         */
            A.USE_YN,         /*��뿩��              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,         /*����� ID             */
            A.REG_DT,         /*�����                */
            A.CHG_ID,         /*������ ID             */
            A.CHG_DT          /*������                */
    FROM    RTCM0050    A
    WHERE   A.CD_GRP_CD LIKE v_Cd_Grp_Cd||'%'
    AND     A.CD_GRP_NM LIKE '%'||v_Cd_Grp_Nm||'%'
    ORDER   BY A.CD_GRP_CD;
    
  END p_sRtcm0050;

  /*****************************************************************************
  -- �����ڵ� Head Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0050(
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,     /*�ڵ�׷��ڵ�           */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,     /*�ڵ�׷��             */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,   /*�ڵ�׷켳��           */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,        /*��ⱸ��               */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,        /*��뿩��               */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,        /*����� ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN


    INSERT INTO RTCM0050 (
            CD_GRP_CD, CD_GRP_NM, CD_GRP_DESC, USE_YN, 
            MDL_CD, REG_ID, REG_DT,CHG_ID,CHG_DT
            )
    VALUES  (
            v_Cd_Grp_Cd, v_Cd_Grp_Nm, v_Cd_Grp_Desc, v_Use_Yn, 
            v_Mdl_Cd, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTCM0050;


  /*****************************************************************************
  -- �����ڵ� Head Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0050(
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,      /*�ڵ�׷��ڵ�       */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE,      /*�ڵ�׷��         */
    v_Cd_Grp_Desc   IN     RTCM0050.CD_GRP_DESC%TYPE,    /*�ڵ�׷켳��       */
    v_Mdl_Cd        IN     RTCM0050.MDL_CD%TYPE,         /*��ⱸ��           */
    v_Use_Yn        IN     RTCM0050.USE_YN%TYPE,         /*��뿩��           */
    v_Reg_Id        IN     RTCM0050.REG_ID%TYPE,         /*����� ID          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0050 SET
           CD_GRP_NM    = v_Cd_Grp_Nm,
           CD_GRP_DESC  = v_Cd_Grp_Desc,
           MDL_CD       = v_Mdl_Cd,
           CHG_DT       = SYSDATE,
           CHG_ID       = v_Reg_Id
    WHERE  CD_GRP_CD    = v_Cd_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0050;
  
  /*****************************************************************************
  -- �����ڵ� Head Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0050(
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,        /*����� ���̵�       */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0050 SET
           USE_YN = 'N',
           CHG_DT = SYSDATE,
           CHG_ID = v_Reg_Id
    WHERE  CD_GRP_CD = v_Cd_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0050;
  
  /*****************************************************************************
  -- �����ڵ� Head ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0050(
    v_Comm_Dvsn     IN  CHAR,                       /*ó������(I,U,D)         */
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,    /*�ڵ�׷��ڵ�            */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,    /*�ڵ�׷��              */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,  /*�ڵ�׷켳��            */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,       /*��ⱸ��                */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,       /*��뿩��                */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,       /*����� ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- �ʼ���: �ڵ�׷��ڵ�, �ڵ�׷��, ��뿩�� ,����� ID
    IF TRIM(v_Cd_Grp_Cd) IS NULL THEN
        v_Return_Message := '�ڵ�׷��ڵ�('||v_Cd_Grp_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cd_Grp_Nm) IS NULL THEN
        v_Return_Message := '�ڵ�׷��('||v_Cd_Grp_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0050Count(v_Cd_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0050(v_Cd_Grp_Cd, v_Cd_Grp_Nm, v_Cd_Grp_Desc, v_Mdl_Cd,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�����ڵ� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;              
                  
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0050(v_Cd_Grp_Cd, v_Cd_Grp_Nm, v_Cd_Grp_Desc, v_Mdl_Cd, 
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڵ� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0050(v_Cd_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڵ� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_IUDRTCM0050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_IUDRTCM0050(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0050;
  
  /*****************************************************************************
  -- �����ڵ� Head Select - �����ڵ� �׷� ��ȸ(2�� ����Ʈ ������)
  *****************************************************************************/
  PROCEDURE p_sRtcm0050ComboList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*�ڵ�׷��ڵ�        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*�ڵ�׷��          */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,      /*�ڵ�׷��ڵ�          */
            A.CD_GRP_NM       /*�ڵ�׷��            */
    FROM    RTCM0050    A
    WHERE   A.CD_GRP_CD LIKE v_Cd_Grp_Cd||'%'
    AND     A.CD_GRP_NM LIKE '%'||v_Cd_Grp_Nm||'%';
    
  END p_sRtcm0050ComboList;
  
END Pkg_Rtcm0050;
/
