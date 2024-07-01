CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0113 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0113
   PURPOSE   ä�� ���� ó����� ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ä�� ���� ó����� ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0113Count(
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,          /*����ȣ            */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE          /*ä�ǰ�������        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ó����� ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*ä�ǰ�������          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*����ȣ              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*ä�ǰ�����������    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*ä�ǰ��������ϱ���  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*ä�ǰ����������      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ä�� ���� ó����� ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*ä�ǰ�������          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*����ȣ              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*ä�ǰ�����������    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*ä�ǰ��������ϱ���  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*ä�ǰ����������      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ó����� ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*ä�ǰ�������          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*����ȣ              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*ä�ǰ�����������    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*ä�ǰ��������ϱ���  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*ä�ǰ����������      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ó����� ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*ä�ǰ�������          */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ó����� ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0113 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Seq       IN OUT RTRE0113.RAMG_SEQ%TYPE,   /*ä�ǰ�������          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*����ȣ              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*ä�ǰ�����������    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*ä�ǰ��������ϱ���  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*ä�ǰ����������      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ä�� ���� ó����� ��� Select - RE-040106_�߽ɰ�� ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE          /*����ȣ              */
    );


  /*****************************************************************************
  -- ä�� ���� ó����� ��� Count - ä�ǰ������� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0113RamgSeq(
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;
        
END Pkg_Rtre0113;
/
