CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0043 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0043
   PURPOSE   KCP ���� ��� ���ʳ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-29  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0043Count(
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,        /*üũ����            */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,        /*ȸ��                */
    v_Cseq           IN RTRE0043.CSEQ%TYPE              /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0043 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Diff_Yn        IN RTRE0043.DIFF_YN%TYPE         /*���̿���              */
    );

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0043 (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN RTRE0043.CSEQ%TYPE,           /*����                  */
    v_Ord_No         IN RTRE0043.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTRE0043.CUST_NM%TYPE,        /*����                */
    v_Recp_Pay       IN RTRE0043.RECP_PAY%TYPE,       /*�������              */
    v_Bank_Nm        IN RTRE0043.BANK_NM%TYPE,        /*�����                */
    v_Cardcom_Nm     IN RTRE0043.CARDCOM_NM%TYPE,     /*ī����              */
    v_App_Amt        IN RTRE0043.APP_AMT%TYPE,        /*�ŷ��ݾ�              */
    v_St_Desc        IN RTRE0043.ST_DESC%TYPE,        /*�ŷ�����              */
    v_App_Day        IN RTRE0043.APP_DAY%TYPE,        /*��������              */
    v_Cnc_Day        IN RTRE0043.CNC_DAY%TYPE,        /*�������              */
    v_Pcnc_Day       IN RTRE0043.PCNC_DAY%TYPE,       /*�κ��������          */
    v_Tno            IN RTRE0043.TNO%TYPE,            /*�ŷ���ȣ              */
    v_App_Desc       IN RTRE0043.APP_DESC%TYPE,       /*�ŷ�����              */
    v_Cnc_Amt        IN RTRE0043.CNC_AMT%TYPE,        /*��ұݾ�              */
    v_Cncp_Amt       IN RTRE0043.CNCP_AMT%TYPE,       /*��Ұ��ɱݾ�          */
    v_Recp_Amt       IN RTRE0043.RECP_AMT%TYPE,       /*����ó���ݾ�          */
    v_Diff_Yn        IN RTRE0043.DIFF_YN%TYPE,        /*���̿���              */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0043 (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN RTRE0043.CSEQ%TYPE,           /*����                  */
    v_Ord_No         IN RTRE0043.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTRE0043.CUST_NM%TYPE,        /*����                */
    v_Recp_Pay       IN RTRE0043.RECP_PAY%TYPE,       /*�������              */
    v_Bank_Nm        IN RTRE0043.BANK_NM%TYPE,        /*�����                */
    v_Cardcom_Nm     IN RTRE0043.CARDCOM_NM%TYPE,     /*ī����              */
    v_App_Amt        IN RTRE0043.APP_AMT%TYPE,        /*�ŷ��ݾ�              */
    v_St_Desc        IN RTRE0043.ST_DESC%TYPE,        /*�ŷ�����              */
    v_App_Day        IN RTRE0043.APP_DAY%TYPE,        /*��������              */
    v_Cnc_Day        IN RTRE0043.CNC_DAY%TYPE,        /*�������              */
    v_Pcnc_Day       IN RTRE0043.PCNC_DAY%TYPE,       /*�κ��������          */
    v_Tno            IN RTRE0043.TNO%TYPE,            /*�ŷ���ȣ              */
    v_App_Desc       IN RTRE0043.APP_DESC%TYPE,       /*�ŷ�����              */
    v_Cnc_Amt        IN RTRE0043.CNC_AMT%TYPE,        /*��ұݾ�              */
    v_Cncp_Amt       IN RTRE0043.CNCP_AMT%TYPE,       /*��Ұ��ɱݾ�          */
    v_Recp_Amt       IN RTRE0043.RECP_AMT%TYPE,       /*����ó���ݾ�          */
    v_Diff_Yn        IN RTRE0043.DIFF_YN%TYPE,        /*���̿���              */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0043 (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN RTRE0043.CSEQ%TYPE,           /*����                  */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0043 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Dup_Gb         IN CHAR,                         /*�ߺ�����(I,M)         */
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN OUT RTRE0043.CSEQ%TYPE,       /*����                  */
    v_Ord_No         IN RTRE0043.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTRE0043.CUST_NM%TYPE,        /*����                */
    v_Recp_Pay       IN RTRE0043.RECP_PAY%TYPE,       /*�������              */
    v_Bank_Nm        IN RTRE0043.BANK_NM%TYPE,        /*�����                */
    v_Cardcom_Nm     IN RTRE0043.CARDCOM_NM%TYPE,     /*ī����              */
    v_App_Amt        IN RTRE0043.APP_AMT%TYPE,        /*�ŷ��ݾ�              */
    v_St_Desc        IN RTRE0043.ST_DESC%TYPE,        /*�ŷ�����              */
    v_App_Day        IN VARCHAR2,                     /*��������              */
    v_Cnc_Day        IN VARCHAR2,                     /*�������              */
    v_Pcnc_Day       IN VARCHAR2,                     /*�κ��������          */
    v_Tno            IN RTRE0043.TNO%TYPE,            /*�ŷ���ȣ              */
    v_App_Desc       IN RTRE0043.APP_DESC%TYPE,       /*�ŷ�����              */
    v_Cncp_Amt       IN RTRE0043.CNCP_AMT%TYPE,       /*��Ұ��ɱݾ�          */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0043Cseq(
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,        /*üũ����            */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE         /*ȸ��                */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Select - ȸ�� ȹ��
  *****************************************************************************/
  PROCEDURE p_sRtre0043CheckSet (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE       /*üũ����              */
    );
      
  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Count - TNO ���� �ߺ�üũ
  *****************************************************************************/
  FUNCTION f_sRtre0043TnoDupCheck(
    v_Check_Day      IN  RTRE0043.CHECK_DAY%TYPE,     /*üũ����              */
    v_Check_Set      IN  RTRE0043.CHECK_SET%TYPE,     /*ȸ��                  */
    v_Tno            IN  RTRE0043.TNO%TYPE            /*�ŷ���ȣ              */  
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Count - TNO ���� �ŷ��ݾװ� ��Ұ��ɱݾ� üũ
  *****************************************************************************/
  FUNCTION f_sRtre0043TnoValueCheck(
    v_Check_Day      IN  RTRE0043.CHECK_DAY%TYPE,     /*üũ����              */
    v_Check_Set      IN  RTRE0043.CHECK_SET%TYPE,     /*ȸ��                  */
    v_Tno            IN  RTRE0043.TNO%TYPE,           /*�ŷ���ȣ              */        
    v_App_Amt        IN  RTRE0043.APP_AMT%TYPE,       /*�ŷ��ݾ�              */
    v_Cncp_Amt       IN  RTRE0043.CNCP_AMT%TYPE       /*��Ұ��ɱݾ�          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� ���� - KCP �������� üũ
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0043Check (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Job_Gb         IN CHAR,                         /*ó������(N:�ű�O:����)*/
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0043;
/
