CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0093 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0093
   PURPOSE   ���ν��� �α� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ν��� �α� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0093Count(
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE            /*�α׼���            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0093
    WHERE   LOGSEQ = v_Logseq;
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0093Count;

  /*****************************************************************************
  -- ���ν��� �α� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0093 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Fdt      IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�FROM          */
    v_Start_Tdt      IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�TO            */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE        /*����޽���            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.LOGSEQ,                    /*�α׼���            */
            A.USER_ID,                   /*����� ���̵�       */
            A.PROC_NM,                   /*���ν�����          */
            A.START_DT,                  /*�����Ͻ�            */
            A.CLOSE_DT,                  /*�����Ͻ�            */
            A.EXEC_TIME,                 /*ó���ð�            */
            A.RELT_CODE,                 /*ó�����            */
            A.RELT_MSG                   /*����޽���          */
    FROM    RTCM0093 A
    WHERE   A.USER_ID   = DECODE(v_User_Id        , NULL, A.USER_ID         , v_User_Id)
    AND     A.PROC_NM   = DECODE(v_Proc_Nm        , NULL, A.PROC_NM         , v_Proc_Nm)
    AND     A.START_DT  BETWEEN v_Start_Fdt AND v_Start_Tdt
    AND     A.EXEC_TIME >= NVL(v_Exec_Time,0)
    AND     A.RELT_CODE = DECODE(v_Relt_Code      , NULL, A.RELT_CODE       , v_Relt_Code)
    AND     A.RELT_MSG  LIKE '%'||v_Relt_Msg||'%';

  END p_sRtcm0093;

  /*****************************************************************************
  -- ���ν��� �α� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*�α׼���              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*�����Ͻ�              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*����޽���            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0093 (
            LOGSEQ,
            USER_ID,
            PROC_NM,
            START_DT,
            CLOSE_DT,
            EXEC_TIME,
            RELT_CODE,
            RELT_MSG
            )
    VALUES  (
            v_Logseq,
            v_User_Id,
            v_Proc_Nm,
            v_Start_Dt,
            v_Close_Dt,
            v_Exec_Time,
            v_Relt_Code,
            v_Relt_Msg
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0093;

  /*****************************************************************************
  -- ���ν��� �α� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*�α׼���              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*�����Ͻ�              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*����޽���            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0093
    SET    USER_ID   = v_User_Id,
           PROC_NM   = v_Proc_Nm,
           START_DT  = v_Start_Dt,
           CLOSE_DT  = v_Close_Dt,
           EXEC_TIME = v_Exec_Time,
           RELT_CODE = v_Relt_Code,
           RELT_MSG  = v_Relt_Msg 
    WHERE  LOGSEQ    = v_Logseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0093;

  /*****************************************************************************
  -- ���ν��� �α� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*�α׼���              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    DELETE RTCM0093
    WHERE  LOGSEQ = v_Logseq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0093.f_DeleteRtcm0093(1)', 'v_Logseq', v_Logseq);
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0093;

  /*****************************************************************************
  -- ���ν��� �α� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0093 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Logseq         IN OUT RTCM0093.LOGSEQ%TYPE,     /*�α׼���              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*�����Ͻ�              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*����޽���            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    
    -- �ʼ���: ����� ���̵�,���ν����� 
    IF (TRIM(v_User_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_User_Id)) THEN
        v_Return_Message := '����� ���̵�('||v_User_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF; 
    
    IF (TRIM(v_Proc_Nm) IS NULL) OR (0 = Pkg_Rtcm0092.f_sRtcm0092ProcCount(UPPER(TRIM(v_Proc_Nm)))) THEN
        v_Return_Message := '���ν�����('||v_Proc_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
     

    IF v_Comm_Dvsn = 'I' THEN
        v_Logseq := Pkg_Rtcm0093.f_sRtcm0093Seq;

        IF 0 != f_InsertRtcm0093(v_Logseq, v_User_Id, v_Proc_Nm, v_Start_Dt, 
                                 v_Close_Dt, v_Exec_Time, v_Relt_Code, v_Relt_Msg, 
                                 v_ErrorText) THEN
            v_Return_Message := '���ν��� �α� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcm0093Count(v_Logseq) THEN
                v_Return_Message := '�ش� �α׼���('||v_Logseq||')�� �̵�� �����̹Ƿ� ó���Ұ�!!';
                RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0093(v_Logseq, v_User_Id, v_Proc_Nm, v_Start_Dt, 
                                     v_Close_Dt, v_Exec_Time, v_Relt_Code, v_Relt_Msg, 
                                     v_ErrorText) THEN
                v_Return_Message := '���ν��� �α� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0093(v_Logseq, v_ErrorText) THEN
                v_Return_Message := '���ν��� �α� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0093.p_IUDRtcm0093(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0093.p_IUDRtcm0093(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0093;

  /*****************************************************************************
  --  ���ν��� �α� ���� - �α׼��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcm0093Seq RETURN NUMBER IS
    v_Sequ_Nmbr   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT  /*+ INDEX_DESC ( RTCM0093 RTCM0093_PK ) */ 
                    LOGSEQ + 1
            FROM    RTCM0093
            WHERE   ROWNUM <= 1), 1)
    INTO    v_Sequ_Nmbr
    FROM    DUAL;

    RETURN v_Sequ_Nmbr;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0093Seq;
  
END Pkg_Rtcm0093;
/
