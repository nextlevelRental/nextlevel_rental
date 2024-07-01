CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0013 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0013
   PURPOSE    �����ü���� log

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-05-25  lyk              1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ü���� log(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0013 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Mob_no         IN RTRE0013.MOB_NO%TYPE,         /*�����ڹ�ȣ            */
    v_Cust_nm        IN RTRE0013.CUST_NM%TYPE,        /*����                */
    v_Cust_tp        IN RTRE0013.CUST_TP%TYPE,        /*������              */
    v_Birth_day      IN RTRE0013.BIRTH_DAY%TYPE,      /*�����������          */
    v_Busl_no        IN RTRE0013.BUSL_NO%TYPE,        /*����ڹ�ȣ            */    
    v_Bank_cd        IN RTRE0013.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_no        IN RTRE0013.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Tr_cd          IN RTRE0013.TR_CD%TYPE,          /*���������ڵ�          */
    v_Call_dt        IN VARCHAR2,        /*�����Ͻ�              */
    v_Rslt_cd        IN RTRE0013.RSLT_CD%TYPE,        /*ó������ڵ�          */
    v_Rslt_msg       IN RTRE0013.RSLT_MSG%TYPE,       /*����޽���            */
    v_Resp_tr_cd     IN RTRE0013.RESP_TR_CD%TYPE,     /*�ŷ��ڵ�              */
    v_Txt_no         IN RTRE0013.TXT_NO%TYPE,         /*����������ȣ          */
    v_Record_data    IN RTRE0013.RECORD_DATA%TYPE,    /*���뵥����            */
    v_Id             IN RTRE0013.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2        
  );

  /*****************************************************************************
  -- �����ü���� log Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0013 (
    v_Mob_no         IN RTRE0013.MOB_NO%TYPE,         /*�����ڹ�ȣ            */
    v_Cust_nm        IN RTRE0013.CUST_NM%TYPE,        /*����                */
    v_Cust_tp        IN RTRE0013.CUST_TP%TYPE,        /*������              */
    v_Birth_day      IN RTRE0013.BIRTH_DAY%TYPE,      /*�����������          */
    v_Busl_no        IN RTRE0013.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_cd        IN RTRE0013.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_no        IN RTRE0013.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Tr_cd          IN RTRE0013.TR_CD%TYPE,          /*���������ڵ�          */
    v_Call_dt        IN VARCHAR2,        /*�����Ͻ�              */
    v_Rslt_cd        IN RTRE0013.RSLT_CD%TYPE,        /*ó������ڵ�          */
    v_Rslt_msg       IN RTRE0013.RSLT_MSG%TYPE,       /*����޽���            */
    v_Resp_tr_cd     IN RTRE0013.RESP_TR_CD%TYPE,     /*�ŷ��ڵ�              */
    v_Txt_no         IN RTRE0013.TXT_NO%TYPE,         /*����������ȣ          */
    v_Record_data    IN RTRE0013.RECORD_DATA%TYPE,    /*���뵥����            */
    v_Id             IN RTRE0013.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2                     
    ) RETURN NUMBER;

END Pkg_Rtre0013;
/
