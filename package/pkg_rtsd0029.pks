CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0029 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0029
   PURPOSE :  ��Ϻ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-23  sePark            1. Created this package.             
*******************************************************************************/


  /*****************************************************************************
  -- ��Ϻ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* �Ǹ��ڵ�         */
  );
  
  /*****************************************************************************
  -��Ϻ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -��Ϻ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;    


  /*****************************************************************************
  -��Ϻ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -��Ϻ���� DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0030DbCopy (
    v_Cnt_Cd            IN RTSD0030.CNT_CD%TYPE,            /* Ÿ�̾��       */
    v_Amt               IN RTSD0030.AMT%TYPE,               /* �ݾ�             */
    v_Reg_Id            IN RTSD0030.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;  
        
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
  );
  
  /*****************************************************************************
  -- �ֹ���� �Ǹ��ڵ忡 ���� ��Ϻ� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029RegAmtInfo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* �Ǹ��ڵ�         */
  );  
END Pkg_Rtsd0029;
/
