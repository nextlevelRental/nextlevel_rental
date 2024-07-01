CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0003 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0003
   PURPOSE   ��Ż ������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-09  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��Ż ������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003Count(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,           /*�������            */
    v_Matnr          IN RTCS0003.MATNR%TYPE             /*��ǰ�ڵ�            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0003
    WHERE   ZMONTH = v_Zmonth
    AND     MATNR  = v_Matnr;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0003Count;

  /*****************************************************************************
  -- ��Ż ������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ZMONTH,                    /*�������            */
            A.MATNR,                     /*��ǰ�ڵ�            */
            A.MENGE,                     /*��ǰ����            */
            A.COSGAMT,                   /*�������            */
            A.CLOSE_YN,                  /*��������            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCS0003 A
    WHERE   A.ZMONTH           = DECODE(v_Zmonth         , NULL, A.ZMONTH          , v_Zmonth)
    AND     A.MATNR            = DECODE(v_Matnr          , NULL, A.MATNR           , v_Matnr)
    AND     A.MENGE            = DECODE(v_Menge          , NULL, A.MENGE           , v_Menge)
    AND     A.COSGAMT          = DECODE(v_Cosgamt        , NULL, A.COSGAMT         , v_Cosgamt)
    AND     A.CLOSE_YN         = DECODE(v_Close_Yn       , NULL, A.CLOSE_YN        , v_Close_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0003;

  /*****************************************************************************
  -- ��Ż ������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0003 (
            ZMONTH,
            MATNR,
            MENGE,
            COSGAMT,
            CLOSE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Zmonth,
            v_Matnr,
            v_Menge,
            v_Cosgamt,
            v_Close_Yn,
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

  END f_InsertRtcs0003;

  /*****************************************************************************
  -- ��Ż ������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0003
    SET    MENGE    = v_Menge,
           COSGAMT  = v_Cosgamt,
           CLOSE_YN = v_Close_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  ZMONTH   = v_Zmonth
    AND    MATNR    = v_Matnr;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0003;

  /*****************************************************************************
  -- ��Ż ������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0003
    SET    CLOSE_YN = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  ZMONTH   = v_Zmonth
    AND    MATNR    = v_Matnr;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0003;

  /*****************************************************************************
  -- ��Ż ������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0003 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����� ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0003Count(v_Zmonth, v_Matnr) THEN

        IF 0 != f_InsertRtcs0003(v_Zmonth, v_Matnr, v_Menge, v_Cosgamt, 
                                 v_Close_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��� ����!!!';
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtcs0003(v_Zmonth, v_Matnr, v_Menge, v_Cosgamt, 
                                     v_Close_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� ����!!!';
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtcs0003(v_Zmonth, v_Matnr, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '���� ����!!!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0003.p_IUDRtcs0003(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0003.p_IUDRtcs0003(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0003;

  /*****************************************************************************
  -- ��Ż ������� �������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003CloseCount(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE        /*��������              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0003
    WHERE   ZMONTH    = v_Zmonth
    AND     CLOSE_YN  = v_Close_Yn;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0003CloseCount;

END Pkg_Rtcs0003;
/
