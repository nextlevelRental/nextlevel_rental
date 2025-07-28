CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0013 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0013
   PURPOSE    출금이체동의 log

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-05-25  lyk              1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 출금이체동의 log(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0013 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Mob_no         IN RTRE0013.MOB_NO%TYPE,         /*수신자번호            */
    v_Cust_nm        IN RTRE0013.CUST_NM%TYPE,        /*고객명                */
    v_Cust_tp        IN RTRE0013.CUST_TP%TYPE,        /*고객유형              */
    v_Birth_day      IN RTRE0013.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Busl_no        IN RTRE0013.BUSL_NO%TYPE,        /*사업자번호            */    
    v_Bank_cd        IN RTRE0013.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_no        IN RTRE0013.ACCT_NO%TYPE,        /*계좌번호              */
    v_Tr_cd          IN RTRE0013.TR_CD%TYPE,          /*업무구분코드          */
    v_Call_dt        IN VARCHAR2,        /*전송일시              */
    v_Rslt_cd        IN RTRE0013.RSLT_CD%TYPE,        /*처리결과코드          */
    v_Rslt_msg       IN RTRE0013.RSLT_MSG%TYPE,       /*결과메시지            */
    v_Resp_tr_cd     IN RTRE0013.RESP_TR_CD%TYPE,     /*거래코드              */
    v_Txt_no         IN RTRE0013.TXT_NO%TYPE,         /*전문고유번호          */
    v_Record_data    IN RTRE0013.RECORD_DATA%TYPE,    /*녹취데이터            */
    v_Id             IN RTRE0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2        
  );

  /*****************************************************************************
  -- 출금이체동의 log Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0013 (
    v_Mob_no         IN RTRE0013.MOB_NO%TYPE,         /*수신자번호            */
    v_Cust_nm        IN RTRE0013.CUST_NM%TYPE,        /*고객명                */
    v_Cust_tp        IN RTRE0013.CUST_TP%TYPE,        /*고객유형              */
    v_Birth_day      IN RTRE0013.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Busl_no        IN RTRE0013.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_cd        IN RTRE0013.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_no        IN RTRE0013.ACCT_NO%TYPE,        /*계좌번호              */
    v_Tr_cd          IN RTRE0013.TR_CD%TYPE,          /*업무구분코드          */
    v_Call_dt        IN VARCHAR2,        /*전송일시              */
    v_Rslt_cd        IN RTRE0013.RSLT_CD%TYPE,        /*처리결과코드          */
    v_Rslt_msg       IN RTRE0013.RSLT_MSG%TYPE,       /*결과메시지            */
    v_Resp_tr_cd     IN RTRE0013.RESP_TR_CD%TYPE,     /*거래코드              */
    v_Txt_no         IN RTRE0013.TXT_NO%TYPE,         /*전문고유번호          */
    v_Record_data    IN RTRE0013.RECORD_DATA%TYPE,    /*녹취데이터            */
    v_Id             IN RTRE0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2                     
    ) RETURN NUMBER;

END Pkg_Rtre0013;