CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0013 AS
/*******************************************************************************
   NAME      Pkg_Rtre0013
   PURPOSE   출금이체동의 log

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-05-25  이영근           1. Created this package body.
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
  ) IS
  
  e_Error EXCEPTION;
  
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN
  
        IF 0 != f_InsertRtre0013(v_Mob_no,   v_Cust_nm,    v_Cust_tp, v_Birth_day,   v_Busl_no,
                                 v_Bank_cd,  v_Acct_no,    v_Tr_cd,   v_Call_dt,     v_Rslt_cd,
                                 v_Rslt_msg, v_Resp_tr_cd, v_Txt_no,  v_Record_data, v_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '출금이체동의log 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF; 
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;   
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    
    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_IUDRtre0013(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_IUDRtre0013(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0013;              
  
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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0013 (
             MOB_NO
            ,SEQ
            ,CUST_NM
            ,CUST_TP
            ,BIRTH_DAY
            ,BUSL_NO            
            ,BANK_CD
            ,ACCT_NO
            ,TR_CD
            ,CALL_DT
            ,RSLT_CD
            ,RSLT_MSG
            ,RESP_TR_CD
            ,TXT_NO
            ,RECORD_DATA
            ,REG_ID
            ,REG_DT
            ,CHG_ID
            ,CHG_DT
            )
    VALUES  (
             v_Mob_no
            ,NVL((SELECT  MAX(A.SEQ)+1
                    FROM  RTRE0013 A
                   WHERE  A.MOB_NO = v_Mob_no), 1)
            ,v_Cust_nm
            ,v_Cust_tp
            ,v_Birth_day
            ,v_Busl_no                    
            ,v_Bank_cd
            ,v_Acct_no
            ,v_Tr_cd
            ,TO_DATE(v_Call_dt,'YYYYMMDDHH24MISS')
            ,v_Rslt_cd
            ,v_Rslt_msg
            ,v_Resp_tr_cd
            ,v_Txt_no
            ,v_Record_data
            ,v_Id
            ,SYSDATE
            ,v_Id
            ,SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  
  END f_InsertRtre0013;

END Pkg_Rtre0013;