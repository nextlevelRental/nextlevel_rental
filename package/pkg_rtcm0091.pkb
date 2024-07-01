CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0091 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0091
   PURPOSE   ����ں� �α� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����ں� �α� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0091Count(
    v_User_Id        IN RTCM0091.USER_ID%TYPE           /*����� ���̵�       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0091
    WHERE   USER_ID = v_User_Id;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0091Count;

  /*****************************************************************************
  -- ����ں� �α� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0091 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*����ڸ�              */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.USER_ID,                   /*����� ���̵�       */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_NM, /*����ڸ�       */
            A.LOG_SAVE_YN,               /*�α� ���� ����      */
            A.PARA_SAVE_YN,              /*�Ű����� ���� ����  */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCM0091 A
    WHERE   A.USER_ID IN (SELECT  B.USER_ID
                          FROM    RTCM0001 B
                          WHERE   B.USER_ID LIKE v_User_Id||'%'
                          AND     B.USER_NM LIKE '%'||v_User_Nm||'%'
                          )
    AND     A.LOG_SAVE_YN  = DECODE(v_Log_Save_Yn  , NULL, A.LOG_SAVE_YN  , v_Log_Save_Yn)
    AND     A.PARA_SAVE_YN = DECODE(v_Para_Save_Yn , NULL, A.PARA_SAVE_YN , v_Para_Save_Yn)
    AND     A.USE_YN       = DECODE(v_Use_Yn       , NULL, A.USE_YN       , v_Use_Yn)
    AND     A.REG_ID       = DECODE(v_Reg_Id       , NULL, A.REG_ID       , v_Reg_Id);

  END p_sRtcm0091;

  /*****************************************************************************
  -- ����ں� �α� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0091 (
            USER_ID,
            LOG_SAVE_YN,
            PARA_SAVE_YN,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_User_Id,
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

  END f_InsertRtcm0091;

  /*****************************************************************************
  -- ����ں� �α� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0091
    SET    LOG_SAVE_YN  = v_Log_Save_Yn,
           PARA_SAVE_YN = v_Para_Save_Yn,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE 
    WHERE  USER_ID      = v_User_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0091;

  /*****************************************************************************
  -- ����ں� �α� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0091
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  USER_ID = v_User_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0091;

  /*****************************************************************************
  -- ����ں� �α� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0091 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:����� ���̵�,�α� ���� ����,�Ű����� ���� ����,��뿩��,  ����� ID    
    IF (TRIM(v_User_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_User_Id)) THEN
        v_Return_Message := '����� ���̵�('||v_User_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
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
        v_Return_Message := '�Ű����� ���� ����('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcm0091Count(v_User_Id) THEN

    
        IF 0 != f_InsertRtcm0091(v_User_Id, v_Log_Save_Yn, v_Para_Save_Yn, v_Use_Yn, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '����ں� �α� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0091(v_User_Id, v_Log_Save_Yn, v_Para_Save_Yn, v_Use_Yn, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '����ں� �α� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0091(v_User_Id, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '����ں� �α� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0091.p_IUDRtcm0091(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0091.p_IUDRtcm0091(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0091;

END Pkg_Rtcm0091;
/
