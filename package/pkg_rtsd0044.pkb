CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0044 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0044
   PURPOSE:   ����ȸ��
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-21  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����ȸ�� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0044 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0044.SALE_CD%TYPE         /* �Ǹ��ڵ�            */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT 
      A.SALE_CD,
      A.EXM_MNT,
      A.REG_DT,
      A.REG_ID,
      A.CHG_DT,
      A.CHG_ID
    FROM RTSD0044 A
    WHERE A.SALE_CD = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd);
    
  END p_sRtsd0044;
  

  /*****************************************************************************
  -����ȸ�� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0044 (
    v_Sale_Cd           IN RTSD0044.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Exm_Mnt           IN RTSD0044.EXM_MNT%TYPE,           /* ����ȸ��         */
    v_Reg_Id            IN RTSD0044.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    
    INSERT  INTO RTSD0044 (
            SALE_CD,
            EXM_MNT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sale_Cd,
            v_Exm_Mnt,
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

  END f_InsertRtsd0044;


  /*****************************************************************************
  -����ȸ�� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0044 (
    v_Sale_Cd         IN RTSD0044.SALE_CD%TYPE          /* �Ǹ��ڵ�              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0044
    WHERE  SALE_CD = v_Sale_Cd;

    Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0044.f_DeleteRtsd0044', '�Ǹ��ڵ�', v_Sale_Cd);

    RETURN SQLCODE;
  END f_DeleteRtsd0044;
  
  
  /*****************************************************************************
  --����ȸ�� (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0044 (
    v_Comm_Dvsn         IN CHAR,                            /* ó������(I,U,D)  */
    v_Sale_Cd           IN RTSD0044.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Exm_Mnt           IN RTSD0044.EXM_MNT%TYPE,           /* ����ȸ��         */
    v_Reg_Id            IN RTSD0044.REG_ID%TYPE,            /* ����� ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0044(v_Sale_Cd, v_Exm_Mnt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '����ȸ�� ��� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0044.p_IUDRtsd0044(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0044.p_IUDRtsd0044(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0044; 
  
  
  
  

END Pkg_Rtsd0044;
/
