CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0090 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0090
   PURPOSE   ���ݿ����� �߱ޱ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0090Count(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,          /*����ȣ            */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE            /*��ϼ���            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0090 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0090 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN OUT RTRE0090.CC_SEQ%TYPE,     /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� - ��ϼ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0090CcSeq(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� - RE-030101_���ݿ����� �������
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090Aggregate (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_Recv_SDay      IN RTRE0030.RECV_DAY%TYPE,       /*��������START         */
    v_Recv_EDay      IN RTRE0030.RECV_DAY%TYPE,       /*��������END           */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� - RE-030102_���ݿ����� ���ϻ��� : ī����ü ������ �������� �۽� ��� ���� ���·� ������ �����ϰ� ���ϻ����ڷḦ RETURN �ϴ� �Լ�
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090FileCreate (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
            
END Pkg_Rtre0090;
/
