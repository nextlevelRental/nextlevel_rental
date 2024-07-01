CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0071 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0071
   PURPOSE   �����ü ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ü ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0071Count(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*�����ü����        */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,           /*����ȣ            */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE          /*�����ټ���          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ü ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0071 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*���¼���              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*�����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE          /*����� ID             */
    );
    
    
  /*****************************************************************************
  -- CMS û������ ���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0071Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE        /*�����ü�Ϸù�ȣ      */ 
    );    

  /*****************************************************************************
  -- �����ü ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*���¼���              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*�����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ü ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*���¼���              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*�����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ü ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ü ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0071 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN OUT RTRE0071.SCHD_SEQ%TYPE,   /*�����ټ���            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*���¼���              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*�����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �����ü ��� - �����ټ��� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0071SchdSeq(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*�����ü����        */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;

    
  /*****************************************************************************
  -- �����ü ��� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0071TransAccum (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*�����ü����          */
    v_Trans_Type     IN CHAR,                         /*��ݴ�󱸺�          */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �����ü ��� ����(RCMS_SEQ Udate)
  *****************************************************************************/
  FUNCTION f_URtre0071TransAccum(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*�����ü����        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

    
  /*****************************************************************************
  -- �����ü ���� CHECK
  *****************************************************************************/
  PROCEDURE p_sRtre0071Processing (
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*����ȣ              */
    v_Rcms_Day       OUT RTRE0071.RCMS_DAY%TYPE,      /*�����ü����          */
    v_Rcms_Amt       OUT RTRE0070.RCMS_AMT%TYPE,      /*�����ü�ݾ�          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre0071;
/
