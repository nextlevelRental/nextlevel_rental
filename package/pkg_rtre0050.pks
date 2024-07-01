CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0050 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0050
   PURPOSE   �������� �����̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �������� �����̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0050List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTRE0050.BFCUST_NO%TYPE       /* ����ȣ             */
    );
    
  /*****************************************************************************
  -- �������� �����̷� Count
  *****************************************************************************/
  FUNCTION f_sRtre0050Count(
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE           /*���������û����    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �����̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTRE0050.BFCUST_NO%TYPE       /* ����ȣ             */
    );

  /*****************************************************************************
  -- �������� �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*���������û��        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*���������û��        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*��������ڵ�          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*�������              */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*÷������              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*������ �������       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*������ ��������       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*������ ���¼���       */
    v_Bfcrd_Seq      IN RTRE0050.BFCRD_SEQ%TYPE,      /*������ ī�����       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*������ ���½�û����   */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*������ �������� ��û  */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*������ �������� ��û  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*������ �������� ��û  */
    v_Bfrpc_Seq      IN RTRE0050.BFRPC_SEQ%TYPE,      /*���� ������ ��������  */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*������ �������       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*������ ��������       */
    v_Afacc_Seq      IN RTRE0050.AFACC_SEQ%TYPE,      /*������ ���¼���       */
    v_Afcrd_Seq      IN RTRE0050.AFCRD_SEQ%TYPE,      /*������ ī�����       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*������ ���½�û ����  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*������ ���½�û ó����*/
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*������ ���½�û ó����*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*������ ���½�û ����  */
    v_Abrpc_Seq      IN RTRE0050.ABRPC_SEQ%TYPE,      /*���� ������ ��������  */
    v_Del_Yn         IN RTRE0050.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �����̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*���������û��        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*���������û��        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*��������ڵ�          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*�������              */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*÷������              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*������ �������       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*������ ��������       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*������ ���¼���       */
    v_Bfcrd_Seq      IN RTRE0050.BFCRD_SEQ%TYPE,      /*������ ī�����       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*������ ���½�û����   */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*������ �������� ��û  */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*������ �������� ��û  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*������ �������� ��û  */
    v_Bfrpc_Seq      IN RTRE0050.BFRPC_SEQ%TYPE,      /*���� ������ ��������  */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*������ �������       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*������ ��������       */
    v_Afacc_Seq      IN RTRE0050.AFACC_SEQ%TYPE,      /*������ ���¼���       */
    v_Afcrd_Seq      IN RTRE0050.AFCRD_SEQ%TYPE,      /*������ ī�����       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*������ ���½�û ����  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*������ ���½�û ó����*/
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*������ ���½�û ó����*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*������ ���½�û ����  */
    v_Abrpc_Seq      IN RTRE0050.ABRPC_SEQ%TYPE,      /*���� ������ ��������  */
    v_Del_Yn         IN RTRE0050.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �����̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �����̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0050 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*���������û��        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*���������û��        */    
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*��������ڵ�          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*�������              */ 
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û ó����       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û ����         */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*÷������              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*������ �������       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*������ ��������       */    
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*������ ���¼���       */    
    v_Bfacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*������ �����ָ�       */
    v_Bfacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*���������� ������   */
    v_Bfaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*������ �����������   */
    v_Bfabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*������ ���� ����ڹ�ȣ*/
    v_Bfbank_No      IN RTRE0010.BANK_CD%TYPE,        /*������ �����ڵ�       */
    v_Bfacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*������ ���¹�ȣ       */    
    v_Bfcrd_Seq      IN RTRE0020.CRD_SEQ%TYPE,        /*������ ī�����       */
    v_Bfccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*������ ī���ָ�       */
    v_Bfccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*������ī�������    */
    v_Bfcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*������ī������������*/
    v_Bfcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*������ī�����ڹ�ȣ  */
    v_Bfcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*������ī����ڵ�      */
    v_Bfcard_No      IN RTRE0020.CARD_NO%TYPE,        /*������ ī���ȣ       */
    v_Bfexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*������ ��ȿ�Ⱓ       */    
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*������ ���½�û����   */ 
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*������ �������       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*������ ��������       */    
    v_Afacc_Seq      IN OUT RTRE0050.AFACC_SEQ%TYPE,  /*������ ���¼���       */    
    v_Afacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*������ ����         */
    v_Afacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*������ ������       */
    v_Afaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*������ �����������   */
    v_Afabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*������ ����ڹ�ȣ     */
    v_Afbank_No      IN RTRE0010.BANK_CD%TYPE,        /*������ �����ڵ�       */
    v_Afacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*������ ���¹�ȣ       */
    v_Afacc_Chk      IN RTRE0010.ACC_CHK%TYPE,        /*������ ����Ȯ�λ���   */
    v_Afcrd_Seq      IN OUT RTRE0050.AFCRD_SEQ%TYPE,  /*������ ī�����       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Afccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*������ ī���ָ�       */
    v_Afccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*������ī�������    */
    v_Afcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*������ī������������*/
    v_Afcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*������ī�����ڹ�ȣ  */
    v_Afcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*������ī����ڵ�      */
    v_Afcard_No      IN RTRE0020.CARD_NO%TYPE,        /*������ ī���ȣ       */
    v_Afexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*������ ��ȿ�Ⱓ       */
    v_Afbkey_Chk     IN RTRE0020.BKEY_CHK%TYPE,       /*������ ī��Ȯ�� ����  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*���������û����      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �������� �����̷� ����(IUD) - �Է°� ��ȿ�� üũ
  *****************************************************************************/
  FUNCTION f_IUDRtre0050InputValueCheck (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*���������û��        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*���������û��        */    
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*��������ڵ�          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*�������              */ 
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û ó����       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û ����         */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*÷������              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*������ �������       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*������ ��������       */    
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*������ ���¼���       */    
    v_Bfacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*������ �����ָ�       */
    v_Bfacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*���������� ������   */
    v_Bfaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*������ �����������   */
    v_Bfabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*������ ���� ����ڹ�ȣ*/
    v_Bfbank_No      IN RTRE0010.BANK_CD%TYPE,        /*������ �����ڵ�       */
    v_Bfacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*������ ���¹�ȣ       */    
    v_Bfcrd_Seq      IN RTRE0020.CRD_SEQ%TYPE,        /*������ ī�����       */
    v_Bfccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*������ ī���ָ�       */
    v_Bfccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*������ī�������    */
    v_Bfcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*������ī������������*/
    v_Bfcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*������ī�����ڹ�ȣ  */
    v_Bfcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*������ī����ڵ�      */
    v_Bfcard_No      IN RTRE0020.CARD_NO%TYPE,        /*������ ī���ȣ       */
    v_Bfexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*������ ��ȿ�Ⱓ       */    
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*������ ���½�û����   */ 
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*������ ����ȣ       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*������ ����û����ȣ   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*������ �������       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*������ ��������       */    
    v_Afacc_Seq      IN OUT RTRE0050.AFACC_SEQ%TYPE,  /*������ ���¼���       */    
    v_Afacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*������ ����         */
    v_Afacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*������ ������       */
    v_Afaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*������ �����������   */
    v_Afabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*������ ����ڹ�ȣ     */
    v_Afbank_No      IN RTRE0010.BANK_CD%TYPE,        /*������ �����ڵ�       */
    v_Afacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*������ ���¹�ȣ       */
    v_Afacc_Chk      IN RTRE0010.ACC_CHK%TYPE,        /*������ ����Ȯ�λ���   */
    v_Afcrd_Seq      IN OUT RTRE0050.AFCRD_SEQ%TYPE,  /*������ ī�����       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*������ BATCH KEY      */
    v_Afccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*������ ī���ָ�       */
    v_Afccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*������ī�������    */
    v_Afcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*������ī������������*/
    v_Afcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*������ī�����ڹ�ȣ  */
    v_Afcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*������ī����ڵ�      */
    v_Afcard_No      IN RTRE0020.CARD_NO%TYPE,        /*������ ī���ȣ       */
    v_Afexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*������ ��ȿ�Ⱓ       */
    v_Afbkey_Chk     IN RTRE0020.BKEY_CHK%TYPE,       /*������ ī��Ȯ�� ����  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE          /*����� ID             */
    ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- �������� �������ɿ��� 
  *****************************************************************************/
  FUNCTION f_sDelete0050Tp (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE        /*����ȣ      */
    ) RETURN VARCHAR;
    
 /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_DeleteRtre0050 (
    v_Ord_No        IN RTRE0050.ORD_NO%TYPE,          /*����ȣ              */
    v_Del_Tp        IN RTRE0050.DEL_YN%TYPE,          /*�������ɿ���          */    
    v_Reg_Id        IN RTRE0050.REG_ID%TYPE,          /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �������� ���� FUNCTION
  *****************************************************************************/
  FUNCTION f_DeleteTpRtre0050 (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*����ȣ               */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
      
  /*****************************************************************************
  -- �� ī�� ���� - ���������û���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0050RpcSeq RETURN NUMBER;


  
  /*****************************************************************************
  -- �������� �����̷� - �ֹ���ȣ ����  ���������̷���  ������ �������� ��û ó������ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0050FinalBfacrqSt(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*�ֹ���ȣ              */
    ) RETURN VARCHAR;
    
    
  /*****************************************************************************
  -- �������� �����̷� - �ֹ���ȣ ����  ���������̷���  ������ ���½�û ó������
  *****************************************************************************/
  FUNCTION f_sRtre0050FinalAfacrqSt(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*�ֹ���ȣ              */
    ) RETURN VARCHAR; 


  /*****************************************************************************
  -- �������� �����̷� - ������ �������� ��û ó������ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0050BfacrqSt(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*��������ڵ�          */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*������ �������       */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*������ ���½�û����   */
    v_RpcAcc_Yn      IN RTRE0050.DEL_YN%TYPE,         /*�������� ���濩��     */
    v_RpcDay_Yn      IN RTRE0050.DEL_YN%TYPE          /*������ ���濩��       */
    ) RETURN VARCHAR;
   
  /*****************************************************************************
  -- �������� �����̷� - ������ ���½�û ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0050AfaccStat(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*��������ڵ�          */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*������ �������       */
    v_RpcAcc_Yn      IN RTRE0050.DEL_YN%TYPE,         /*�������� ���濩��     */
    v_RpcDay_Yn      IN RTRE0050.DEL_YN%TYPE,         /*������ ���濩��       */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*������ ���½�û����   */     
    v_Afacc_Stat     OUT RTRE0050.AFACC_STAT%TYPE,    /*������ ���½�û ����  */
    v_Afacrq_St      OUT RTRE0050.AFACRQ_ST%TYPE      /*������ ���½�û ó����*/
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �������� �����̷� - ������ ���½�û �߻�����/ó����/���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0050AfacrqFgDaySeq(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,          /*��������ڵ�          */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*���½�û ó����       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,        /*���½�û ����         */
    v_Afacrq_Fg      OUT RTRE0050.AFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Afacrq_Day     OUT RTRE0050.AFACRQ_DAY%TYPE,     /*������ ���½�û ó����*/
    v_Afacrq_Seq     OUT RTRE0050.AFACRQ_SEQ%TYPE      /*������ ���½�û ����  */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �����̷� - ����ȣ ���� �������� ���� ���������û���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0050RpcSeq(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*����ȣ               */
    ) RETURN NUMBER;    



  /*****************************************************************************
  -- �������� �����̷� - ���������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050Terminate (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*������ �������� ��û  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*������ �������� ��û  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  
  /*****************************************************************************
  -- �������� �����̷� - ���½�û�� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050Application (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*������ ���½�û �߻���*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*������ ���½�û ó����*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*������ ���½�û ����  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �������� �����̷� - ���½�û ���ó�� ���°�(������) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050AfterResult (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*������ ���½�û ����  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*������ ���½�û ó����*/
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �����̷� - ���½�û ���ó�� ���°�(������)  Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050BeforeResult (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*���������û����      */   
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*������ �������� ��û  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0050;
/
