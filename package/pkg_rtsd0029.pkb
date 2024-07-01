CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0029 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0029
   PURPOSE:  ��Ϻ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-23  sePark             1. Created this package body.
*******************************************************************************/
 
  /*****************************************************************************
  -- ��Ϻ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* �Ǹ��ڵ�         */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.SALE_CD,                          /* �Ǹ��ڵ�   */
            A.CNT_CD,                           /* Ÿ�̾�� */
            NVL(A.AMT,0) AS AMT,                /* �ݾ�       */
            A.REG_DT,                           /* �����     */
            A.REG_ID,                           /* ����� ID  */
            A.CHG_ID,                           /* ������ ID  */
            A.CHG_DT                            /* ������     */
    FROM    RTSD0029    A
    WHERE   A.SALE_CD   = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd)
    ORDER BY A.SALE_CD, A.CNT_CD;
    
  END p_sRtsd0029;


  /*****************************************************************************
  -��Ϻ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN
    
    INSERT  INTO RTSD0029 (
            SALE_CD,
            CNT_CD,
            AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sale_Cd,
            v_Cnt_Cd,
            v_Amt,
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

  END f_InsertRtsd0029;


  /*****************************************************************************
  -��Ϻ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN
    
    UPDATE RTSD0029
    SET    AMT          = v_Amt,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  SALE_CD      = v_Sale_Cd
    AND    CNT_CD       = v_Cnt_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0029;


  /*****************************************************************************
  -��Ϻ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0029
    WHERE  SALE_CD      = v_Sale_Cd
    AND    CNT_CD       = v_Cnt_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0029;

  /*****************************************************************************
  -��Ϻ���� DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0030DbCopy (
    v_Cnt_Cd            IN RTSD0030.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0030.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0030.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0030 (
            RTSD0030_SEQ,
            CNT_CD,
            AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            'SP'||LPAD(SEQ_RTSD0030RTSD0030_SEQ.NEXTVAL, 7, 0),
            v_Cnt_Cd,
            v_Amt,
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

  END f_InsertRtsd0030DbCopy;


  /*****************************************************************************
  --��Ϻ���� (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0029 (
    v_Comm_Dvsn         IN CHAR,                            /* ó������(I,U,D)  */
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0029(v_Sale_Cd, v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��Ϻ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
       
        IF 0 != f_InsertRtsd0030DbCopy(v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��Ϻ���� Db Copy ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
        
    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRtsd0029(v_Sale_Cd, v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��Ϻ���� ���� ����!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF 0 != f_InsertRtsd0030DbCopy(v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��Ϻ���� Db Copy ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    

    ELSIF v_Comm_Dvsn = 'D' THEN
        
        IF 0 != f_DeleteRtsd0029(v_Sale_Cd, v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��Ϻ���� ���� ����!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0029.p_IUDRtsd0029(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0029.p_IUDRtsd0029(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0029; 
  

  /*****************************************************************************
  -- �ֹ���� �Ǹ��ڵ忡 ���� ��Ϻ� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029RegAmtInfo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* �Ǹ��ڵ�         */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  NVL(A.AMT,0) AS CD,                       /* �ݾ�       */
            NVL(A.AMT,0) AS CD_NM                     /* �ݾ�       */
    FROM    RTSD0029    A
    WHERE   A.SALE_CD   = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd)
    ORDER BY A.SALE_CD, A.CNT_CD;
    
  END p_sRtsd0029RegAmtInfo;
  

END Pkg_Rtsd0029;
/
