CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0025 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0025
   PURPOSE:   ���μ�������

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-11      sePark       1. Created this package.
******************************************************************************/

  PROCEDURE p_sRtsd0025 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0025.DC_GB%TYPE,     /* ���α����ڵ�            */
    v_Std_Str_Day   IN     RTSD0025.STD_STR_DAY%TYPE     /* ���ν�����(���ؽ�����   */
  );

  /*****************************************************************************
  -���λ����� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0025 (
    v_Dc_Gb             IN RTSD0025.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0025.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Cd             IN RTSD0025.DC_CD%TYPE,             /* �����ڵ�       */
    v_Dc_Rate           IN RTSD0025.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0025.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Min_Cnt           IN RTSD0025.MIN_CNT%TYPE,           /* �ּҰ�         */
    v_Max_Cnt           IN RTSD0025.MAX_CNT%TYPE,           /* �ִ��         */
    v_Std_End_Day       IN RTSD0025.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Desc           IN RTSD0025.DC_DESC%TYPE,           /* ���           */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -���λ����� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0025 (
    v_Dc_Gb             IN RTSD0025.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0025.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Cd             IN RTSD0025.DC_CD%TYPE,             /* �����ڵ�       */
    v_Dc_Rate           IN RTSD0025.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0025.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Min_Cnt           IN RTSD0025.MIN_CNT%TYPE,           /* �ּҰ�         */
    v_Max_Cnt           IN RTSD0025.MAX_CNT%TYPE,           /* �ִ��         */
    v_Std_End_Day       IN RTSD0025.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Desc           IN RTSD0025.DC_DESC%TYPE,           /* ���           */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -���λ�����DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0027 (
    v_Dc_Gb             IN RTSD0027.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0027.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Cd             IN RTSD0027.DC_CD%TYPE,             /* �����ڵ�       */
    v_Dc_Rate           IN RTSD0027.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0027.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Min_Cnt           IN RTSD0027.MIN_CNT%TYPE,           /* �ּҰ�         */
    v_Max_Cnt           IN RTSD0027.MAX_CNT%TYPE,           /* �ִ��         */
    v_Std_End_Day       IN RTSD0027.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Desc           IN RTSD0027.DC_DESC%TYPE,           /* ���           */
    v_Reg_Id            IN RTSD0027.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  --���μ����������(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0025 (
    v_Comm_Dvsn         IN CHAR,                            /* ó������(I,U,D)*/
    v_Dc_Gb             IN RTSD0025.DC_GB%TYPE,             /* ���α����ڵ�   */
    v_Std_Str_Day       IN RTSD0025.STD_STR_DAY%TYPE,       /* ���ν�����     */
    v_Dc_Cd             IN RTSD0025.DC_CD%TYPE,             /* �����ڵ�       */
    v_Dc_Rate           IN RTSD0025.DC_RATE%TYPE,           /* ������         */
    v_Dc_Amt            IN RTSD0025.DC_AMT%TYPE,            /* ���αݾ�       */
    v_Min_Cnt           IN RTSD0025.MIN_CNT%TYPE,           /* �ּҰ�         */
    v_Max_Cnt           IN RTSD0025.MAX_CNT%TYPE,           /* �ִ��         */
    v_Std_End_Day       IN RTSD0025.STD_END_DAY%TYPE,       /* ����������     */
    v_Dc_Desc           IN RTSD0025.DC_DESC%TYPE,           /* ���           */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,            /* ����� ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );


/*****************************************************************************
-- �ܫq���αݾ�
*****************************************************************************/
FUNCTION f_sRtsd0025SearchAmt(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* ��ü��ȣ            */
) RETURN NUMBER;

/*****************************************************************************
-- ��ü������
*****************************************************************************/
FUNCTION f_sRtsd0025SearchRate(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* ��ü��ȣ            */
) RETURN NUMBER;

END Pkg_Rtsd0025;
/
