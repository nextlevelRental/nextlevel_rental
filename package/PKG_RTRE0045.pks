CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0045 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0045
   PURPOSE   KCP 결제 대사 기초내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-29  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0045Count(
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,        /*체크일자            */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,        /*회차                */
    v_Cseq           IN RTRE0045.CSEQ%TYPE              /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0045 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,      /*회차                  */
    v_Diff_Yn        IN RTRE0045.DIFF_YN%TYPE         /*차이여부              */
    );

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0045 (
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN RTRE0045.CSEQ%TYPE,           /*순번                  */
    v_Ord_No         IN RTRE0045.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTRE0045.CUST_NM%TYPE,        /*고객명                */
    v_Recp_Pay       IN RTRE0045.RECP_PAY%TYPE,       /*결제방법              */
    v_Bank_Nm        IN RTRE0045.BANK_NM%TYPE,        /*은행명                */
    v_Cardcom_Nm     IN RTRE0045.CARDCOM_NM%TYPE,     /*카드사명              */
    v_App_Amt        IN RTRE0045.APP_AMT%TYPE,        /*거래금액              */
    v_St_Desc        IN RTRE0045.ST_DESC%TYPE,        /*거래상태              */
    v_App_Day        IN RTRE0045.APP_DAY%TYPE,        /*승인일자              */
    v_Cnc_Day        IN RTRE0045.CNC_DAY%TYPE,        /*취소일자              */
    v_Pcnc_Day       IN RTRE0045.PCNC_DAY%TYPE,       /*부분취소일자          */
    v_Tno            IN RTRE0045.TNO%TYPE,            /*거래번호              */
    v_App_Desc       IN RTRE0045.APP_DESC%TYPE,       /*거래구분              */
    v_Cnc_Amt        IN RTRE0045.CNC_AMT%TYPE,        /*취소금액              */
    v_Cncp_Amt       IN RTRE0045.CNCP_AMT%TYPE,       /*취소가능금액          */
    v_Recp_Amt       IN RTRE0045.RECP_AMT%TYPE,       /*수납처리금액          */
    v_Diff_Yn        IN RTRE0045.DIFF_YN%TYPE,        /*차이여부              */
    v_Reg_Id         IN RTRE0045.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0045 (
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN RTRE0045.CSEQ%TYPE,           /*순번                  */
    v_Ord_No         IN RTRE0045.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTRE0045.CUST_NM%TYPE,        /*고객명                */
    v_Recp_Pay       IN RTRE0045.RECP_PAY%TYPE,       /*결제방법              */
    v_Bank_Nm        IN RTRE0045.BANK_NM%TYPE,        /*은행명                */
    v_Cardcom_Nm     IN RTRE0045.CARDCOM_NM%TYPE,     /*카드사명              */
    v_App_Amt        IN RTRE0045.APP_AMT%TYPE,        /*거래금액              */
    v_St_Desc        IN RTRE0045.ST_DESC%TYPE,        /*거래상태              */
    v_App_Day        IN RTRE0045.APP_DAY%TYPE,        /*승인일자              */
    v_Cnc_Day        IN RTRE0045.CNC_DAY%TYPE,        /*취소일자              */
    v_Pcnc_Day       IN RTRE0045.PCNC_DAY%TYPE,       /*부분취소일자          */
    v_Tno            IN RTRE0045.TNO%TYPE,            /*거래번호              */
    v_App_Desc       IN RTRE0045.APP_DESC%TYPE,       /*거래구분              */
    v_Cnc_Amt        IN RTRE0045.CNC_AMT%TYPE,        /*취소금액              */
    v_Cncp_Amt       IN RTRE0045.CNCP_AMT%TYPE,       /*취소가능금액          */
    v_Recp_Amt       IN RTRE0045.RECP_AMT%TYPE,       /*수납처리금액          */
    v_Diff_Yn        IN RTRE0045.DIFF_YN%TYPE,        /*차이여부              */
    v_Reg_Id         IN RTRE0045.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0045 (
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN RTRE0045.CSEQ%TYPE,           /*순번                  */
    v_Reg_Id         IN RTRE0045.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0045 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dup_Gb         IN CHAR,                         /*중복구분(I,M)         */
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN OUT RTRE0045.CSEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTRE0045.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTRE0045.CUST_NM%TYPE,        /*고객명                */
    v_Recp_Pay       IN RTRE0045.RECP_PAY%TYPE,       /*결제방법              */
    v_Bank_Nm        IN RTRE0045.BANK_NM%TYPE,        /*은행명                */
    v_Cardcom_Nm     IN RTRE0045.CARDCOM_NM%TYPE,     /*카드사명              */
    v_App_Amt        IN RTRE0045.APP_AMT%TYPE,        /*거래금액              */
    v_St_Desc        IN RTRE0045.ST_DESC%TYPE,        /*거래상태              */
    v_App_Day        IN VARCHAR2,                     /*승인일자              */
    v_Cnc_Day        IN VARCHAR2,                     /*취소일자              */
    v_Pcnc_Day       IN VARCHAR2,                     /*부분취소일자          */
    v_Tno            IN RTRE0045.TNO%TYPE,            /*거래번호              */
    v_App_Desc       IN RTRE0045.APP_DESC%TYPE,       /*거래구분              */
    v_Cncp_Amt       IN RTRE0045.CNCP_AMT%TYPE,       /*취소가능금액          */
    v_Reg_Id         IN RTRE0045.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0045Cseq(
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,        /*체크일자            */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE         /*회차                */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Select - 회차 획득
  *****************************************************************************/
  PROCEDURE p_sRtre0045CheckSet (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE       /*체크일자              */
    );
      
  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Count - TNO 기준 중복체크
  *****************************************************************************/
  FUNCTION f_sRtre0045TnoDupCheck(
    v_Check_Day      IN  RTRE0045.CHECK_DAY%TYPE,     /*체크일자              */
    v_Check_Set      IN  RTRE0045.CHECK_SET%TYPE,     /*회차                  */
    v_Tno            IN  RTRE0045.TNO%TYPE            /*거래번호              */  
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Count - TNO 기준 거래금액과 취소가능금액 체크
  *****************************************************************************/
  FUNCTION f_sRtre0045TnoValueCheck(
    v_Check_Day      IN  RTRE0045.CHECK_DAY%TYPE,     /*체크일자              */
    v_Check_Set      IN  RTRE0045.CHECK_SET%TYPE,     /*회차                  */
    v_Tno            IN  RTRE0045.TNO%TYPE,           /*거래번호              */        
    v_App_Amt        IN  RTRE0045.APP_AMT%TYPE,       /*거래금액              */
    v_Cncp_Amt       IN  RTRE0045.CNCP_AMT%TYPE       /*취소가능금액          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- KCP 결제 대사 기초내역 관리 - KCP 결제내역 체크
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0045Check (
    v_Check_Day      IN RTRE0045.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0045.CHECK_SET%TYPE,      /*회차                  */
    v_Job_Gb         IN CHAR,                         /*처리구분(N:신규O:기존)*/
    v_Reg_Id         IN RTRE0045.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0045;