CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0025 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0025
   PURPOSE:   ���μ�������

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-11  sePark           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���μ������� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0025 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0025.DC_GB%TYPE,         /* ���α����ڵ�            */
    v_Std_Str_Day   IN     RTSD0025.STD_STR_DAY%TYPE    /* ���ν�����(���ؽ�����   */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.DC_GB,                                                        /* ���α����ڵ�  */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S207', A.DC_GB) GRP_STD_NM,   /* ���α��и�    */
            TO_CHAR(TO_DATE(A.STD_STR_DAY),'YYYY-MM-DD') AS STD_STR_DAY,    /* ���ν�����    */
            A.DC_CD,                                                        /* �����ڵ�      */
            RTRIM(TO_CHAR(A.DC_RATE,'FM9990D99'),'.')||'%' AS DC_RATE,      /* ������        */
            A.DC_AMT,                                                       /* ���αݾ�      */
            A.MIN_CNT,                                                      /* �ּҰ�        */
            A.MAX_CNT,                                                      /* �ִ��        */
            TO_CHAR(TO_DATE(A.STD_END_DAY),'YYYY-MM-DD') AS STD_END_DAY,    /* ����������    */
            A.DC_DESC,                                                      /* ���          */
            A.REG_DT,                                                       /* �����        */
            A.REG_ID,                                                       /* ����� ID     */
            A.CHG_ID,                                                       /* ������ ID     */
            A.CHG_DT                                                        /* ������        */
    FROM    RTSD0025    A
    WHERE   A.DC_GB       = DECODE(v_Dc_Gb, NULL, A.DC_GB, v_Dc_Gb)
    AND     A.STD_STR_DAY = DECODE(v_Std_Str_Day, NULL, A.STD_STR_DAY, v_Std_Str_Day)
    AND     A.STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
    ORDER BY A.DC_CD;
  END p_sRtsd0025;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0025 (
            DC_GB,
            STD_STR_DAY,
            DC_CD,
            DC_RATE,
            DC_AMT,
            MIN_CNT,
            MAX_CNT,
            STD_END_DAY,
            DC_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dc_Gb,
            REGEXP_REPLACE(v_Std_Str_Day,'-',''),
            v_Dc_Cd,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Min_Cnt,
            v_Max_Cnt,
            REGEXP_REPLACE(v_Std_End_Day,'-',''),
            v_Dc_Desc,
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

  END f_InsertRtsd0025;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0025
    SET    DC_RATE      = v_Dc_Rate,
           DC_AMT       = v_Dc_Amt,
           MIN_CNT      = v_Min_Cnt,
           MAX_CNT      = v_Max_Cnt,
           STD_END_DAY  = REGEXP_REPLACE(v_Std_End_Day,'-',''),
           DC_DESC      = v_Dc_Desc,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  DC_GB        = v_Dc_Gb
    AND    STD_STR_DAY  = REGEXP_REPLACE(v_Std_Str_Day,'-','')
    AND    STD_END_DAY  = REGEXP_REPLACE(v_Std_End_Day,'-','')
    AND    DC_CD        = v_Dc_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0025;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0027 (
            RTSD0027_SEQ,
            DC_GB,
            STD_STR_DAY,
            DC_CD,
            DC_RATE,
            DC_AMT,
            MIN_CNT,
            MAX_CNT,
            STD_END_DAY,
            DC_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            'SD'||LPAD(SEQ_RTSD0027RTSD0027_SEQ.NEXTVAL, 7, 0),
            v_Dc_Gb,
            REGEXP_REPLACE(v_Std_Str_Day,'-',''),
            v_Dc_Cd,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Min_Cnt,
            v_Max_Cnt,
            REGEXP_REPLACE(v_Std_End_Day,'-',''),
            v_Dc_Desc,
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

  END f_InsertRtsd0027;

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
    ) IS

    e_Error EXCEPTION;

  BEGIN

    IF v_Comm_Dvsn = 'I' THEN
        IF 0 != f_InsertRtsd0025(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���λ����� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtsd0027(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���λ�����DB Copy ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtsd0025(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���λ����� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtsd0027(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���λ�����DB Copy ��� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0025.p_IUDRtsd0025(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0025.p_IUDRtsd0025(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0025;


/*****************************************************************************
-- ��ü���αݾ�
*****************************************************************************/
FUNCTION f_sRtsd0025SearchAmt(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* ��ü��ȣ            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;

  BEGIN
    SELECT NVL(DC_AMT, 0)
    INTO v_Curr_Cnt
    from RTSD0025
    WHERE DC_GB='C'
    AND     STD_STR_DAY<=to_char(sysdate,'YYYYMMDD')
    AND     MIN_CNT<=rest_cnt
    AND     MAX_CNT>=rest_cnt;

    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRtsd0025SearchAmt;

/*****************************************************************************
 -- ��ü���αݾ�
 *****************************************************************************/
FUNCTION f_sRtsd0025SearchRate(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* ��ü��ȣ            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;

  BEGIN
    SELECT NVL(DC_RATE, 0)
    INTO v_Curr_Cnt
    from RTSD0025
    WHERE DC_GB='C'
    AND     STD_STR_DAY<=to_char(sysdate,'YYYYMMDD')
    AND     MIN_CNT<=rest_cnt
    AND     MAX_CNT>=rest_cnt;

    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRtsd0025SearchRate;
END Pkg_Rtsd0025;
/
