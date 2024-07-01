CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_RTSD0117 AS
/*******************************************************************************
   NAME      Pkg_RTSD0117
   PURPOSE   ��ۿϷ� ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��ۿϷ� ��� Count
  *****************************************************************************/
  FUNCTION f_sRTSD0117Count(
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,           /*����ȣ            */
    v_Vbeln          IN RTSD0117.VBELN%TYPE             /*SAP �ֹ���ȣ        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0117
    WHERE   ORD_NO = v_Ord_No
    AND     VBELN  = v_Vbeln;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTSD0117Count;

  /*****************************************************************************
  -- ��ۿϷ� ��� Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0117 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*����ȣ            */
            A.VBELN,                     /*SAP �ֹ���ȣ        */
            A.VBELN_D,                   /*SAP ��۹�ȣ        */
            A.GI_DAY,                    /*�������            */
            A.SMS_DAY,                   /*SMS �߼�����        */
            A.SMS_YN,                    /*SMS �߼ۿ���        */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0117 A
    WHERE   A.ORD_NO   = DECODE(v_Ord_No  , NULL, A.ORD_NO  , v_Ord_No)
    AND     A.VBELN    = DECODE(v_Vbeln   , NULL, A.VBELN   , v_Vbeln)
    AND     A.VBELN_D  = DECODE(v_Vbeln_D , NULL, A.VBELN_D , v_Vbeln_D)
    AND     A.GI_DAY   = DECODE(v_Gi_Day  , NULL, A.GI_DAY  , v_Gi_Day)
    AND     A.SMS_DAY  = DECODE(v_Sms_Day , NULL, A.SMS_DAY , v_Sms_Day)
    AND     A.SMS_YN   = DECODE(v_Sms_Yn  , NULL, A.SMS_YN  , v_Sms_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id);

  END p_sRTSD0117;

  /*****************************************************************************
  -- ��ۿϷ� ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0117 (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0117 (
            ORD_NO,
            VBELN,
            VBELN_D,
            GI_DAY,
            SMS_DAY,
            SMS_YN,
            NUM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            SUBSTR(v_Ord_No,1,12),  
            v_Vbeln,
            v_Vbeln_D,
            v_Gi_Day,
            v_Sms_Day,
            v_Sms_Yn,
            SUBSTR(v_Ord_No,14,1),
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

  END f_InsertRTSD0117;

  /*****************************************************************************
  -- ��ۿϷ� ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0117 (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0117
    SET    VBELN_D = v_Vbeln_D,
           GI_DAY  = v_Gi_Day,
           SMS_DAY = v_Sms_Day,
           SMS_YN  = v_Sms_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  ORD_NO  = v_Ord_No
    AND    VBELN   = v_Vbeln;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0117;

  /*****************************************************************************
  -- ��ۿϷ� ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRTSD0117 (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0117
    SET    SMS_YN = 'N',
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE 
    WHERE  ORD_NO = v_Ord_No
    AND    VBELN  = v_Vbeln;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRTSD0117;

  /*****************************************************************************
  -- ��ۿϷ� ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0117 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
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

    IF 0 = f_sRTSD0117Count(v_Ord_No, v_Vbeln) THEN

        IF 0 != f_InsertRTSD0117(v_Ord_No, v_Vbeln, v_Vbeln_D, v_Gi_Day, 
                                 v_Sms_Day, v_Sms_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��ۿϷ� ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRTSD0117(v_Ord_No, v_Vbeln, v_Vbeln_D, v_Gi_Day, 
                                     v_Sms_Day, v_Sms_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��ۿϷ� ��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRTSD0117(v_Ord_No, v_Vbeln, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��ۿϷ� ��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTSD0117.p_IUDRTSD0117(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTSD0117.p_IUDRTSD0117(2)', v_ErrorText, v_Return_Message);

  END p_IUDRTSD0117;


  /*****************************************************************************
  -- ��ۿϷ� ��� Update - Erprecvdelivery
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0117Recv (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0117
    SET    VBELN_D = v_Vbeln_D,
           GI_DAY  = v_Gi_Day,
           NUM     = SUBSTR(v_Ord_No,14,1),
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  ORD_NO  = SUBSTR(v_Ord_No,1,12)
    AND    VBELN   = v_Vbeln;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0117Recv;
  
END Pkg_RTSD0117;
/
