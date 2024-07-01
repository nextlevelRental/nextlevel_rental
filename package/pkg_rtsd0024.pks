CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0024 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0024
   PURPOSE:   ���ε��

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-12   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- ���ε�� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0024 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0024.DC_GB%TYPE     /* ���α����ڵ�            */
  );
        
  /*****************************************************************************
  -���ε�� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0024 (
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* �ߺ����ο���   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* ���λ󼼿���   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER; 
    
  /*****************************************************************************
  -���ε�� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0024 (
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* �ߺ����ο���   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* ���λ󼼿���   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;    

  /*****************************************************************************
  -���ε��DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0026 (
    v_Dc_Gb             IN RTSD0026.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0026.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Rate           IN RTSD0026.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0026.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Mlt_Dc_Yn         IN RTSD0026.MLT_DC_YN%TYPE,         /* �ߺ����ο���   */
    v_Std_End_Day       IN RTSD0026.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* ���λ󼼿���   */
    v_Reg_Id            IN RTSD0026.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --���ε��(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0024 (
    v_Comm_Dvsn         IN CHAR,                            /* ó������(I,U,D)*/
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* �ߺ����ο���   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* ���λ󼼿���   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* ����� ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �緣Ż ��Ϻ� ������
  *****************************************************************************/
  FUNCTION f_regiAmtRt
  RETURN VARCHAR;    
    
END Pkg_Rtsd0024;
/
