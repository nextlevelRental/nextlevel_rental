CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0118 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0118
   PURPOSE   ���ڼ��� ��ȸ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0118Count(
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,           /*����ȣ            */
    v_Seq            IN RTSD0118.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0118 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE          /*����ȣ              */
    );

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*����                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*����ȣ              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*��������              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*���ϸ�                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*��ȸ����              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*�ڵ��߼ۿ���          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*�̸��� �ּ�           */   
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*��ȸ��ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*��ȸ�ڸ�              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*����                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*����ȣ              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*��������              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*���ϸ�                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*��ȸ����              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*�ڵ��߼ۿ���          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*�̸��� �ּ�           */   
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*��ȸ��ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*��ȸ�ڸ�              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0118 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN OUT RTSD0118.SEQ%TYPE,        /*����                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*����ȣ              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*��������              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*���ϸ�                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*��ȸ����              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*�ڵ��߼ۿ���          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*�̸��� �ּ�           */   
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*��ȸ��ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*��ȸ�ڸ�              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ڼ��� ��ȸ���� - ����(Seq) ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0118Seq(
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;
    
        
END Pkg_Rtsd0118;
/
