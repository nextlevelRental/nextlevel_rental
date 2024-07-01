CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0081 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0081
   PURPOSE   ī����ü ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ī����ü ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0081Count(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*ī����ü����        */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,           /*����ȣ            */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE          /*�����ټ���          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����ü ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0081 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*ī����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ī����ü û������ ���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0081Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE        /*ī����ü�Ϸù�ȣ      */ 
    ); 
    
  /*****************************************************************************
  -- ī����ü ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*ī����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����ü ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*ī����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����ü ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����ü ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0081 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN OUT RTRE0081.SCHD_SEQ%TYPE,   /*�����ټ���            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*����ȣ              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*û������              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*�����������        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*����û������ȣ      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*ī����ü�Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ī����ü ��� - �����ټ��� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0081SchdSeq(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*ī����ü����        */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;


    
  /*****************************************************************************
  -- ī����ü ��� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0081CardTrans (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_Trans_Type     IN CHAR,                         /*��ݴ�󱸺�          */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

    
  /*****************************************************************************
  -- ī����ü ��� ����(RCRD_SEQ Udate)
  *****************************************************************************/
  FUNCTION f_URtre0081CardTrans(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*ī����ü����        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- CLOB �ڷ�Parsing 
  *****************************************************************************/
  PROCEDURE p_Rtre0081ClobParsing(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Clob_Data      IN RTRE0099.FILE_DATA%TYPE,          /*CLOB�ڷ�          */
    v_Clob_Type      IN VARCHAR,                          /*CLOB TYPE         */
    v_Type           IN VARCHAR,                          /*Parsing ������    */
    v_Spe_Yn         IN VARCHAR,                          /*����ó������      */
    v_Spe_Pos        IN NUMBER,                           /*����ó����ġ      */
    v_Row_Count      IN OUT NUMBER,                       /*�������ѰǼ�      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    

  /*****************************************************************************
  -- CLOB �ڷ�Parsing TEST
  *****************************************************************************/
  PROCEDURE p_Rtre0081ClobTest(
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Test           IN  VARCHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    

  /*****************************************************************************
  -- ī����ü ���� CHECK
  *****************************************************************************/
  PROCEDURE p_sRtre0081Processing (
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*����ȣ              */
    v_Rcrd_Day       OUT RTRE0081.RCRD_DAY%TYPE,      /*ī����ü����          */
    v_Rcrd_Amt       OUT RTRE0080.RCRD_AMT%TYPE,      /*ī����ü�ݾ�          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre0081;
/
