CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0092 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0092
   PURPOSE   ���ν����� �α� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ν����� �α� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0092Count(
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE           /*���ν�����          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0092
    WHERE   PROC_NM = v_Proc_Nm;
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0092Count;

  /*****************************************************************************
  -- ���ν����� �α� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE       /*���ν�������          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PROC_NM,                   /*���ν�����          */
            A.PROC_DESC,                 /*���ν�������        */
            A.LOG_SAVE_YN,               /*�α����忩��        */
            A.PARA_SAVE_YN,              /*�Ű��������忩��    */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCM0092 A
    WHERE   A.PROC_NM  LIKE '%'||v_Proc_Nm||'%'
    AND     A.PROC_DESC LIKE '%'||v_Proc_Desc||'%';

  END p_sRtcm0092;

  /*****************************************************************************
  -- ���ν����� �α� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*���ν�������          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*�α����忩��          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*�Ű��������忩��      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0092 (
            PROC_NM,
            PROC_DESC,
            LOG_SAVE_YN,
            PARA_SAVE_YN,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Proc_Nm,
            v_Proc_Desc,
            v_Log_Save_Yn,
            v_Para_Save_Yn,
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

  END f_InsertRtcm0092;

  /*****************************************************************************
  -- ���ν����� �α� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*���ν�������          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*�α����忩��          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*�Ű��������忩��      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0092
    SET    PROC_DESC    = v_Proc_Desc,
           LOG_SAVE_YN  = v_Log_Save_Yn,
           PARA_SAVE_YN = v_Para_Save_Yn,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE 
    WHERE  PROC_NM      = v_Proc_Nm;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0092;

  /*****************************************************************************
  -- ���ν����� �α� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0092
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  PROC_NM = v_Proc_Nm;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0092;

  /*****************************************************************************
  -- ���ν����� �α� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0092 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*���ν�������          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*�α����忩��          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*�Ű��������忩��      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ���ν����� ,�α����忩�� ,�Ű��������忩�� ,��뿩�� ,����� ID
    IF (TRIM(v_Proc_Nm) IS NULL) OR (0 = Pkg_Rtcm0092.f_sRtcm0092ProcCount(UPPER(TRIM(v_Proc_Nm)))) THEN
        v_Return_Message := '���ν�����('||v_Proc_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
     
    IF (TRIM(v_Log_Save_Yn) IS NULL) OR (v_Log_Save_Yn NOT IN ('Y','N')) THEN
        v_Return_Message := '�α� ���� ����('||v_Log_Save_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Para_Save_Yn) IS NULL) OR (v_Para_Save_Yn NOT IN ('Y','N')) THEN
        v_Return_Message := '�Ű����� ���� ����('||v_Para_Save_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    IF (TRIM(v_Use_Yn) IS NULL) OR (v_Use_Yn NOT IN ('Y','N')) THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcm0092Count(v_Proc_Nm) THEN

        IF 0 != f_InsertRtcm0092(v_Proc_Nm, v_Proc_Desc, v_Log_Save_Yn, v_Para_Save_Yn, v_Use_Yn, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���ν����� �α� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0092(v_Proc_Nm, v_Proc_Desc, v_Log_Save_Yn, v_Para_Save_Yn, v_Use_Yn, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ν����� �α� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0092(v_Proc_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ν����� �α� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0092.p_IUDRtcm0092(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0092.p_IUDRtcm0092(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0092;


  /*****************************************************************************
  -- ���ν��� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0092ProcCount(
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE           /*���ν�����          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    USER_PROCEDURES
    WHERE   OBJECT_NAME    = SUBSTR(v_Proc_Nm, 1, INSTR(v_Proc_Nm, '.',1,1)-1)
    AND     PROCEDURE_NAME = SUBSTR(v_Proc_Nm, INSTR(v_Proc_Nm, '.',1,1)+1);
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0092ProcCount;
  

END Pkg_Rtcm0092;
/
