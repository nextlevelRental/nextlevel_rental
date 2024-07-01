CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0110 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0110
   PURPOSE   ä�� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ä�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0110Count(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,          /*ä�ǰ������        */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE       /*ä�ǰ������          */
    );

  /*****************************************************************************
  -- ä�� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*ä�ǰ������          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*��ü���ڼ����ݾ�      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*ä�ǰ�����            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*���Ǽ�              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*ä�ǰ������          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*��ü���ڼ����ݾ�      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*ä�ǰ�����            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*���Ǽ�              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0110 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*ä�ǰ������          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*��ü���ڼ����ݾ�      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*ä�ǰ�����            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*���Ǽ�              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ä�� ���� - RE-040111 ä�Ǵ������-ä�ǰ������ ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0110Aggregate (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Proc_Yn        IN VARCHAR,                      /*ó������ ����         */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ä�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0110AfterCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*ä�ǰ������        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ä�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0110EqualCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*ä�ǰ������        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ä�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110Equal (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
END Pkg_Rtre0110;
/
