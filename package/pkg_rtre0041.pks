CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0041 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0041
   PURPOSE   �¶��� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �¶��� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0041Count(
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �¶��� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0041 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*��������              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG�ŷ���ȣ            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �¶��� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*��������              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG�ŷ���ȣ            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �¶��� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*��������              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG�ŷ���ȣ            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �¶��� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �¶��� ���� ���� ����- PG�� �������ó��: ���θ����� ������ ������ ���Ͽ� ����ó���ϴ� �Լ�
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041PgReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG�ŷ���ȣ            */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �¶��� ���� ���� ����- �������ó��: ������ϵ� ������ ���Ͽ� ��� ó�� �ϴ� �����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041RecCancel (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �¶��� ���� ���� - �����ŷ���ȣ ü�� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0041RecvSeq RETURN NUMBER;
  
  /*****************************************************************************
  -- �¶��� ���� ���� - ��Ұ��ɿ��� �Ǵ� - ��Ұ��ɻ��� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0041CncCount(
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER ;
    
  /*****************************************************************************
  -- �¶��� ���� ���� - ������� - ���ŷ���������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0041Cancel (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*��������              */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���θ� ��� û��������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0041RecvThisMonList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE         /*����ȣ              */
    ) ;    
    
  /*****************************************************************************
  -- ���θ� ���� û��������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0041RecvPrvsMonList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE,         /*����ȣ              */
    v_Start_Day      IN RTRE0030.RECV_DAY%TYPE,        /* �������� */
    v_End_Day        IN RTRE0030.RECV_DAY%TYPE         /* �������� */
    );
    
  /*****************************************************************************
  -- ���θ� ��ü������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE         /*������Ű              */
    );         
    
  /*****************************************************************************
  -- ���θ� ��ü��������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreDtlList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0109.ORD_NO%TYPE         /*������Ű              */
    );    
   
  /*****************************************************************************
  -- ���θ� ��ü��������ȸ(O2O����)
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreDtlListNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0109.ORD_NO%TYPE,         /*������Ű              */
    v_Str_Day      IN RTSD0109.ZFB_DAY%TYPE,
    v_End_Day      IN RTSD0109.ZFB_DAY%TYPE
    );
     
  /*****************************************************************************
  -- �¶��� �ߵ��ϳ� ���� ���� ����- PG�� �������ó��: ���θ����� ������ �ߵ��ϳ��ݾ��� ó���ϴ� �Լ�(�ߵ������� ��å�� �Ұ�)
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041MfpPgReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
--    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG�ŷ���ȣ            */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*��������(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Balance_Amt    IN RTSD0109.ARRE_AMT%TYPE,       /*�����ݾ�            */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*���ι̴��            */
    v_Sale_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*�ѷ�Ż�ݾ�            */
    v_Recv_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*�Ѽ����ݾ�(����������) */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
    

  /*****************************************************************************
  --���θ� ��ü�� ������
  *****************************************************************************/
  PROCEDURE sRtre0041ShopOverdueInfo (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE         /* ����ȣ             */
  );

  /*****************************************************************************
  --���θ� ����/��û ������
  *****************************************************************************/
  PROCEDURE sRtre0041ShopApprovalInfo (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE         /* ����ȣ              */
  );
  
  /*****************************************************************************
  -- �¶��� ���� ���� ����- PG�� �������ó��: ���θ����� ������ �������ο� ���Ͽ� ����ó���ϴ� �Լ�
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041PgPrptReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*����ȣ              */
--    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*�������              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG�ŷ���ȣ            */
    v_Dc_Cd          IN RTSD0025.DC_CD%TYPE,          /* �����ڵ� */
    v_Prpt_Mon       IN RTSD0025.MAX_CNT%TYPE,        /* �������� */        
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
  
END Pkg_Rtre0041;
/
