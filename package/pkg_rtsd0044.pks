CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0044 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0044
   PURPOSE:   ����ȸ��

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-11-21   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- ����ȸ�� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0044 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0044.SALE_CD%TYPE     /* �ǸŻ�ǰ�ڵ�            */
  );
        
  /*****************************************************************************
  -����ȸ�� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0044 (
    v_Sale_Cd           IN RTSD0044.SALE_CD%TYPE,           /* �Ǹ��ڵ�         */
    v_Exm_Mnt           IN RTSD0044.EXM_MNT%TYPE,           /* ����ȸ��         */
    v_Reg_Id            IN RTSD0044.REG_ID%TYPE,            /* ����� ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -����ȸ�� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0044 (
    v_Sale_Cd         IN RTSD0044.SALE_CD%TYPE          /* �Ǹ��ڵ�              */
    ) RETURN NUMBER;  
  
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
  ); 
   
END Pkg_Rtsd0044;
/
