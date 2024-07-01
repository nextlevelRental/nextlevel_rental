CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0021 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0021
   PURPOSE:   ���ѱ׷� Master ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  KBJ             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ѱ׷� Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0021Count(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0021
    WHERE   AUTH_GRP_CD = v_Auth_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0021Count;

  /*****************************************************************************
  -- ���ѱ׷� Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0021 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,      /*���ѱ׷��ڵ�        */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,      /*���ѱ׷��          */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE     /*���ѱ׷켳��        */    
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  AUTH_GRP_CD,      /*���ѱ׷��ڵ�          */
            AUTH_GRP_NM,      /*���ѱ׷��            */
            AUTH_GRP_DESC,    /*���ѱ׷켳��          */
            USE_YN,           /*��뿩��              */
            REG_ID,           /*����� ID             */
            REG_DT,           /*�����                */
            CHG_ID,           /*������ ID             */
            CHG_DT            /*������                */
    FROM    RTCM0021 A
    WHERE   A.AUTH_GRP_CD LIKE v_Auth_Grp_Cd||'%'
    AND     A.AUTH_GRP_NM LIKE '%'||v_Auth_Grp_Nm||'%'
    AND     A.USE_YN = 'Y';
    
  END p_sRtcm0021;

  /*****************************************************************************
  -- ���ѱ׷� Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*���ѱ׷��        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*���ѱ׷켳��      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*��뿩��          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */  
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0021 (
            AUTH_GRP_CD,
            AUTH_GRP_NM,
            AUTH_GRP_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Auth_Grp_Cd,
            v_Auth_Grp_Nm,
            v_Auth_Grp_Desc,
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
        
  END f_InsertRTCM0021;


  /*****************************************************************************
  -- ���ѱ׷� Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*���ѱ׷��        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*���ѱ׷켳��      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*��뿩��          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0021
    SET    AUTH_GRP_NM   = v_Auth_Grp_Nm,  
           AUTH_GRP_DESC = v_Auth_Grp_Desc,
           USE_YN        = v_Use_Yn,      
           CHG_ID        = v_Reg_Id,       
           CHG_DT        = SYSDATE   
    WHERE  AUTH_GRP_CD   = v_Auth_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0021;
  
  /*****************************************************************************
  -- ���ѱ׷� Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0021
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  AUTH_GRP_CD = v_Auth_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0021;

  
  /*****************************************************************************
  -- ���ѱ׷� Master ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0021(
    v_Comm_Dvsn      IN CHAR,                             /*ó������(I,U,D)   */
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*���ѱ׷��        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*���ѱ׷켳��      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*��뿩��          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- �ʼ���: ���ѱ׷��ڵ�, ���ѱ׷��, ��뿩��, �����ID
    IF TRIM(v_Auth_Grp_Cd) IS NULL THEN
        v_Return_Message := '���ѱ׷��ڵ�('||v_Auth_Grp_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Auth_Grp_Nm) IS NULL THEN
        v_Return_Message := '���ѱ׷��('||v_Auth_Grp_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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
    
    IF 0 = f_sRtcm0021Count(v_Auth_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0021(v_Auth_Grp_Cd, v_Auth_Grp_Nm, v_Auth_Grp_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���ѱ׷� Master ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0021(v_Auth_Grp_Cd, v_Auth_Grp_Nm, v_Auth_Grp_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ѱ׷� Master ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0021(v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ѱ׷� Master ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0021.p_IUDRTCM0021(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0021.p_IUDRTCM0021(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0021;
  
END Pkg_Rtcm0021;
/
