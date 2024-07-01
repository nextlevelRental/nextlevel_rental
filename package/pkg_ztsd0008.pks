CREATE OR REPLACE PACKAGE NXRADMIN.PKG_ZTSD0008 AS
/*******************************************************************************
   NAME:      Pkg_Ztsd0008
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-03  Sean             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sZtsd0008 (
    Ref_Cursor  IN OUT SYS_REFCURSOR, 
    v_PRICE_CD               ZTSD0008.PRICE_CD%TYPE, 
    v_MAT_CD                 ZTSD0008.MAT_CD%TYPE, 
    v_PERIOD_CD              ZTSD0008.PERIOD_CD%TYPE, 
    v_CNT_CD                 ZTSD0008.CNT_CD%TYPE, 
    v_REGI_CD                ZTSD0008.REGI_CD%TYPE, 
    v_STR_DAY                ZTSD0008.STR_DAY%TYPE, 
    v_END_DAY                ZTSD0008.END_DAY%TYPE, 
    v_SEQ                    ZTSD0008.SEQ%TYPE, 
    v_AMT                    ZTSD0008.AMT%TYPE, 
    v_USE_YN                 ZTSD0008.USE_YN%TYPE, 
    v_REG_ID                 ZTSD0008.REG_ID%TYPE
  );

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDZtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� ���� ����ä��
  *****************************************************************************/
  FUNCTION f_sZtsd0008MaxSeq(
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE          /*�������� �Ϸ���     */
    ) RETURN NUMBER;   

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sZtsd0008Count(
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,          /*�������� �Ϸ���     */
    v_Seq            IN Ztsd0008.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;


END PKG_ZTSD0008;
/
