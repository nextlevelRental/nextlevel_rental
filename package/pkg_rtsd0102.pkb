CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0102 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0102
   PURPOSE   ���� �� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� �� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0102Count(
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE            /*�����չ�ȣ        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0102
    WHERE   GRP_NO = v_Grp_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0102Count;

  /*****************************************************************************
  -- ���� �� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,           /*�����չ�ȣ        */
    v_Grp_Day_Start  IN RTSD0102.GRP_DAY%TYPE,          /*��������            */
    v_Grp_Day_End    IN RTSD0102.GRP_DAY%TYPE,          /*��������            */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,           /*���տ���            */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*����ȣ            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.GRP_NO  ,       /*�����չ�ȣ   */
            A.GRP_DAY ,       /*��������       */
            A.SPT_DAY ,       /*�и�����       */
            A.GRP_YN  ,       /*���տ���       */
            A.REG_ID  ,       /*����� ID      */
            A.REG_DT  ,       /*�����        */
            A.CHG_ID  ,       /*������ ID      */
            A.CHG_DT  ,       /*������         */
            COUNT(B.GRP_NO)  AS CUST_GRP_COUNT
    FROM    RTSD0102 A LEFT OUTER JOIN RTSD0103 B ON A.GRP_NO = B.GRP_NO
    WHERE   (v_Grp_No        IS NULL OR A.GRP_NO = v_Grp_No)
    AND     (v_Grp_Day_Start IS NULL OR A.GRP_DAY BETWEEN v_Grp_Day_Start AND v_Grp_Day_End)
    AND     (v_Grp_Yn        IS NULL OR A.GRP_YN = v_Grp_Yn)
    AND     (v_Cust_No       IS NULL OR B.CUST_NO = v_Cust_No)
    GROUP   BY A.GRP_NO, A.GRP_DAY, A.SPT_DAY, A.SPT_DAY, A.GRP_YN, A.REG_ID, A.REG_DT, A.CHG_ID, A.CHG_DT
    ORDER   BY A.GRP_NO ASC;

  END p_sRtsd0102;

  /*****************************************************************************
  -- ���� �� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0102 (
            GRP_NO,
            GRP_DAY,
            SPT_DAY,
            GRP_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Grp_No,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            v_Spt_Day,
            'Y',
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

  END f_InsertRtsd0102;

  /*****************************************************************************
  -- ���� �� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0102
    SET    GRP_DAY = DECODE(v_Grp_Yn,'Y',TO_CHAR(SYSDATE,'YYYYMMDD'),v_Grp_Day),
           SPT_DAY = DECODE(v_Grp_Yn,'N',TO_CHAR(SYSDATE,'YYYYMMDD'),''),
           GRP_YN  = v_Grp_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  GRP_NO  = v_Grp_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0102;

  /*****************************************************************************
  -- ���� �� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0102
    WHERE  GRP_NO = v_Grp_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.f_DeleteRtsd0102(1)', 'v_Grp_No', v_Grp_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.f_DeleteRtsd0102(1)', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0102;

  /*****************************************************************************
  -- ���� �� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0102 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Grp_No         IN OUT RTSD0102.GRP_NO%TYPE,     /*�����չ�ȣ          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Grp_Yn) IS NULL THEN
        v_Return_Message := '���տ���('||v_Grp_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtsd0102Count(v_Grp_No) THEN

        v_Grp_No := f_sRtsd0102GrpNo();

        IF 0 != f_InsertRtsd0102(v_Grp_No, v_Grp_Day , v_Spt_Day , v_Grp_Yn , 
                                 v_Reg_Id , v_ErrorText) THEN
            v_Return_Message := '���� �� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0102(v_Grp_No , v_Grp_Day , v_Spt_Day , v_Grp_Yn , 
                                     v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '���� �� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0102(v_Grp_No , v_Reg_Id ,
                                     v_ErrorText) THEN
                v_Return_Message := '���� �� ���� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.p_IUDRtsd0102(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.p_IUDRtsd0102(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0102;

  /*****************************************************************************
  -- ���� �� ������ - ���� �� ��ȣ ü��
  *****************************************************************************/
  FUNCTION f_sRtsd0102GrpNo RETURN VARCHAR IS
    v_Grp_No   RTSD0102.GRP_NO%TYPE DEFAULT NULL;   /*���հ���ȣ            */
  BEGIN

    SELECT  NVL(MAX(GRP_NO)+1,'1000000001')
    INTO    v_Grp_No
    FROM    RTSD0102;

    RETURN v_Grp_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0102GrpNo;
END Pkg_Rtsd0102;
/
