CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0002 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0002
   PURPOSE   ����_��� ��Ī ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����_��� ��Ī ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002Count(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,      /*���                */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE             /*���� ����           */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0002
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd
    AND     FR_CD       = v_Fr_Cd;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0002Count;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MODEL_CD,                  /*����                */
            A.CONTENTS_CD,               /*���                */
            A.FR_CD,                     /*���� ����           */
            A.MC_NM,                     /*����-����         */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0002 A
    WHERE   A.MODEL_CD    = DECODE(v_Model_Cd    , NULL, A.MODEL_CD    , v_Model_Cd)
    AND     A.CONTENTS_CD = DECODE(v_Contents_Cd , NULL, A.CONTENTS_CD , v_Contents_Cd)
    AND     A.FR_CD       = DECODE(v_Fr_Cd       , NULL, A.FR_CD       , v_Fr_Cd)
    AND     A.MC_NM       = DECODE(v_Mc_Nm       , NULL, A.MC_NM       , v_Mc_Nm)
    AND     A.USE_YN      = DECODE(v_Use_Yn      , NULL, A.USE_YN      , v_Use_Yn)
    AND     A.REG_ID      = DECODE(v_Reg_Id      , NULL, A.REG_ID      , v_Reg_Id);

  END p_sRtsd0002;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0002 (
            MODEL_CD,
            CONTENTS_CD,
            FR_CD,
            MC_NM,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Model_Cd,
            v_Contents_Cd,
            v_Fr_Cd,
            TRIM(v_Mc_Nm),
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

  END f_InsertRtsd0002;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0002
    SET    MC_NM       = v_Mc_Nm,
           USE_YN      = v_Use_Yn,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd
    AND    FR_CD       = v_Fr_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0002;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0002
    SET    USE_YN       = 'N',
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  MODEL_CD     = v_Model_Cd
    AND    CONTENTS_CD  = v_Contents_Cd
    AND    FR_CD        = v_Fr_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0002;

  /*****************************************************************************
  -- ����_��� ��Ī ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0002 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����, ���, ���� ����, ����-����, ��뿩�� ,����� ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := '����('||v_Model_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '���('||v_Contents_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fr_Cd) IS NULL THEN
        v_Return_Message := '���� ����('||v_Fr_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mc_Nm) IS NULL THEN
        v_Return_Message := '����-����('||v_Mc_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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

    IF 0 = f_sRtsd0002Count(v_Model_Cd, v_Contents_Cd, v_Fr_Cd) THEN

        IF 0 != f_InsertRtsd0002(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Mc_Nm,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '����_��� ��Ī ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE

        IF v_Comm_Dvsn IN ('I', 'U') THEN

            IF 0 != f_UpdateRtsd0002(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Mc_Nm,
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '����_��� ��Ī ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        

            -- ���������� ���� ������� �԰ݰ��������� ������ ó���Ұ� ó����
            IF 0 != Pkg_Rtsd0004.f_sRtsd0004UseYnCount(v_Model_Cd, v_Contents_Cd, v_Fr_Cd) THEN
                v_Return_Message := '�ش� ���� ������ ������ ��ϵ� �԰ݰ��������� �����Ƿ� ó�� �Ұ�. �԰ݰ��������� �̻�� ó���� �����Ͻñ� �ٶ��ϴ�.';
                RAISE e_Error;
            END IF;
            
            IF 0 != f_DeleteRtsd0002(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '����_��� ��Ī ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_IUDRtsd0002(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_IUDRtsd0002(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0002;


  /*****************************************************************************
  -- ����_��� ��Ī ���� - ���������� ��ȿ�� ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0002MasterCheck (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����, ���, ���� ����, ����-����, ��뿩�� ,����� ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := '����('||v_Model_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '���('||v_Contents_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    -- ���������Ͱ� ��� �̻��ó�� �� ���
    IF 0 = f_sRtsd0002UseYnCount(v_Model_Cd, v_Contents_Cd) THEN


        -- ���������� ���� ������� �԰ݰ��������� ������ ó���Ұ� ó����
        IF 0 != Pkg_Rtsd0004.f_sRtsd0004UseYnCount(v_Model_Cd, v_Contents_Cd, NULL) THEN
            v_Return_Message := '�ش� ���� ������ ������ ��ϵ� �԰ݰ��������� �����Ƿ� ó�� �Ұ�. �԰ݰ��������� �̻�� ó���� �����Ͻñ� �ٶ��ϴ�.';
            RAISE e_Error;
        END IF;

        -- ���������Ͱ� ��� �̻��ó�� �� ��� ���������͵� �̻��ó��
        IF 0 != Pkg_Rtsd0001.f_UpdateRtsd0001UseYn(v_Model_Cd, v_Contents_Cd, 'N', v_Reg_Id, v_ErrorText) THEN
             v_Return_Message := '���������Ͱ� ��� �̻��ó�� �� ��� ���������͵� �̻��ó�� - ����!!!'||'-'||v_ErrorText;
             v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_UpdateRtsd0002MasterCheck(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_UpdateRtsd0002MasterCheck(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0002MasterCheck;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002UseYnCount(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE       /*���                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0002
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd
    AND     USE_YN      ='Y';
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0002UseYnCount;

END Pkg_Rtsd0002;
/
