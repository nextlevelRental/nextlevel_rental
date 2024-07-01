CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0094 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0094
   PURPOSE   ���ν��� ���� �α� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ν��� ���� �α� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0094Count(
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,           /*�α׼���            */
    v_Pseq           IN RTCM0094.PSEQ%TYPE              /*�Ű����� ����       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0094
    WHERE   LOGSEQ = v_Logseq
    AND     PSEQ   = v_Pseq;
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0094Count;

  /*****************************************************************************
  -- ���ν��� ���� �α� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0094 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE          /*�α׼���              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.LOGSEQ,                    /*�α׼���            */
            A.PSEQ,                      /*�Ű����� ����       */
            A.PAR_NM,                    /*�Ű����� ��         */
            A.PAR_VALUE                  /*�Ű����� ��         */
    FROM    RTCM0094 A
    WHERE   A.LOGSEQ = v_Logseq
    ORDER   BY A.PSEQ;

  END p_sRtcm0094;

  /*****************************************************************************
  -- ���ν��� ���� �α� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*�Ű����� ��           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*�Ű����� ��           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0094 (
            LOGSEQ,
            PSEQ,
            PAR_NM,
            PAR_VALUE
            )
    VALUES  (
            v_Logseq,
            NVL((SELECT MAX(PSEQ)+1
                 FROM    RTCM0094
                 WHERE   LOGSEQ = v_Logseq), 1),
            v_Par_Nm,
            v_Par_Value
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0094;

  /*****************************************************************************
  -- ���ν��� ���� �α� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*�Ű����� ����         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*�Ű����� ��           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*�Ű����� ��           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0094
    SET    PAR_NM    = v_Par_Nm,
           PAR_VALUE = v_Par_Value 
    WHERE  LOGSEQ    = v_Logseq
    AND    PSEQ      = v_Pseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0094;

  /*****************************************************************************
  -- ���ν��� ���� �α� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*�Ű����� ����         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    DELETE RTCM0094
    WHERE  LOGSEQ = v_Logseq
    AND    PSEQ   = v_Pseq;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.f_DeleteRtcm0094(1)', 'v_Logseq', v_Logseq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.f_DeleteRtcm0094(1)', 'v_Pseq', v_Pseq);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0094;

  /*****************************************************************************
  -- ���ν��� ���� �α� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0094 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*�Ű����� ����         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*�Ű����� ��           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*�Ű����� ��           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�α׼���, �Ű����� ��    
    IF TRIM(v_Logseq) IS NULL THEN
        v_Return_Message := '�α׼���('||v_Logseq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Par_Nm) IS NULL  THEN
        v_Return_Message := '�Ű����� ��('||v_Par_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtcm0094(v_Logseq, v_Par_Nm, v_Par_Value, v_ErrorText) THEN
            v_Return_Message := '���ν��� ���� �α� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcm0094Count(v_Logseq, v_Pseq) THEN
            v_Return_Message := '�ش� �α׼���('||v_Logseq||'),�Ű�����('||v_Pseq||')�� �̵�� �����̹Ƿ� ó���Ұ�!!';
            RAISE e_Error;        
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0094(v_Logseq, v_Pseq, v_Par_Nm, v_Par_Value, v_ErrorText) THEN
                v_Return_Message := '���ν��� ���� �α� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0094(v_Logseq, v_Pseq, v_ErrorText) THEN
                v_Return_Message := '���ν��� ���� �α� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.p_IUDRtcm0094(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.p_IUDRtcm0094(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0094;

END Pkg_Rtcm0094;
/
