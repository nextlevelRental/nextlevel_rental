CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0050 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0050
   PURPOSE   결제정보 변경이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 결제정보 변경이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0050List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0050.BFCUST_NO%TYPE       /* 고객번호             */
    );
    
  /*****************************************************************************
  -- 결제정보 변경이력 Count
  *****************************************************************************/
  FUNCTION f_sRtre0050Count(
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE           /*결제변경요청순번    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결제정보 변경이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0050.BFCUST_NO%TYPE       /* 고객번호             */
    );

  /*****************************************************************************
  -- 결제정보 변경이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */
    v_Bfcrd_Seq      IN RTRE0050.BFCRD_SEQ%TYPE,      /*변경전 카드순번       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*변경전 계좌해지 신청  */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfrpc_Seq      IN RTRE0050.BFRPC_SEQ%TYPE,      /*이전 변경후 수정내역  */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */
    v_Afacc_Seq      IN RTRE0050.AFACC_SEQ%TYPE,      /*변경후 계좌순번       */
    v_Afcrd_Seq      IN RTRE0050.AFCRD_SEQ%TYPE,      /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*변경후 계좌신청 상태  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*변경후 계좌신청 처리상*/
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*변경후 계좌신청 순번  */
    v_Abrpc_Seq      IN RTRE0050.ABRPC_SEQ%TYPE,      /*이전 변경전 수정내역  */
    v_Del_Yn         IN RTRE0050.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결제정보 변경이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */
    v_Bfcrd_Seq      IN RTRE0050.BFCRD_SEQ%TYPE,      /*변경전 카드순번       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*변경전 계좌해지 신청  */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfrpc_Seq      IN RTRE0050.BFRPC_SEQ%TYPE,      /*이전 변경후 수정내역  */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */
    v_Afacc_Seq      IN RTRE0050.AFACC_SEQ%TYPE,      /*변경후 계좌순번       */
    v_Afcrd_Seq      IN RTRE0050.AFCRD_SEQ%TYPE,      /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*변경후 계좌신청 상태  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*변경후 계좌신청 처리상*/
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*변경후 계좌신청 순번  */
    v_Abrpc_Seq      IN RTRE0050.ABRPC_SEQ%TYPE,      /*이전 변경전 수정내역  */
    v_Del_Yn         IN RTRE0050.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결제정보 변경이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결제정보 변경이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0050 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */    
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */ 
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청 처리일       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청 순번         */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */    
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */    
    v_Bfacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경전 예금주명       */
    v_Bfacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경전계좌 고객유형   */
    v_Bfaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경전 법정생년월일   */
    v_Bfabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경전 계좌 사업자번호*/
    v_Bfbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경전 은행코드       */
    v_Bfacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경전 계좌번호       */    
    v_Bfcrd_Seq      IN RTRE0020.CRD_SEQ%TYPE,        /*변경전 카드순번       */
    v_Bfccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경전 카드주명       */
    v_Bfccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경전카드고객유형    */
    v_Bfcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경전카드법정생년월일*/
    v_Bfcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경전카드사업자번호  */
    v_Bfcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경전카드사코드      */
    v_Bfcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경전 카드번호       */
    v_Bfexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경전 유효기간       */    
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */ 
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */    
    v_Afacc_Seq      IN OUT RTRE0050.AFACC_SEQ%TYPE,  /*변경후 계좌순번       */    
    v_Afacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경후 고객명         */
    v_Afacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경후 고객유형       */
    v_Afaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경후 법정생년월일   */
    v_Afabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경후 사업자번호     */
    v_Afbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경후 은행코드       */
    v_Afacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경후 계좌번호       */
    v_Afacc_Chk      IN RTRE0010.ACC_CHK%TYPE,        /*변경후 계좌확인상태   */
    v_Afcrd_Seq      IN OUT RTRE0050.AFCRD_SEQ%TYPE,  /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경후 카드주명       */
    v_Afccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경후카드고객유형    */
    v_Afcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경후카드법정생년월일*/
    v_Afcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경후카드사업자번호  */
    v_Afcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경후카드사코드      */
    v_Afcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경후 카드번호       */
    v_Afexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경후 유효기간       */
    v_Afbkey_Chk     IN RTRE0020.BKEY_CHK%TYPE,       /*변경후 카드확인 상태  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*결제변경요청순번      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 결제정보 변경이력 관리(IUD) - 입력값 유효성 체크
  *****************************************************************************/
  FUNCTION f_IUDRtre0050InputValueCheck (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */    
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */ 
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청 처리일       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청 순번         */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */    
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */    
    v_Bfacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경전 예금주명       */
    v_Bfacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경전계좌 고객유형   */
    v_Bfaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경전 법정생년월일   */
    v_Bfabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경전 계좌 사업자번호*/
    v_Bfbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경전 은행코드       */
    v_Bfacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경전 계좌번호       */    
    v_Bfcrd_Seq      IN RTRE0020.CRD_SEQ%TYPE,        /*변경전 카드순번       */
    v_Bfccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경전 카드주명       */
    v_Bfccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경전카드고객유형    */
    v_Bfcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경전카드법정생년월일*/
    v_Bfcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경전카드사업자번호  */
    v_Bfcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경전카드사코드      */
    v_Bfcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경전 카드번호       */
    v_Bfexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경전 유효기간       */    
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */ 
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */    
    v_Afacc_Seq      IN OUT RTRE0050.AFACC_SEQ%TYPE,  /*변경후 계좌순번       */    
    v_Afacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경후 고객명         */
    v_Afacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경후 고객유형       */
    v_Afaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경후 법정생년월일   */
    v_Afabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경후 사업자번호     */
    v_Afbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경후 은행코드       */
    v_Afacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경후 계좌번호       */
    v_Afacc_Chk      IN RTRE0010.ACC_CHK%TYPE,        /*변경후 계좌확인상태   */
    v_Afcrd_Seq      IN OUT RTRE0050.AFCRD_SEQ%TYPE,  /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경후 카드주명       */
    v_Afccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경후카드고객유형    */
    v_Afcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경후카드법정생년월일*/
    v_Afcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경후카드사업자번호  */
    v_Afcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경후카드사코드      */
    v_Afcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경후 카드번호       */
    v_Afexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경후 유효기간       */
    v_Afbkey_Chk     IN RTRE0020.BKEY_CHK%TYPE,       /*변경후 카드확인 상태  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE          /*등록자 ID             */
    ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- 결제정보 삭제가능여부 
  *****************************************************************************/
  FUNCTION f_sDelete0050Tp (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE        /*계약번호      */
    ) RETURN VARCHAR;
    
 /*****************************************************************************
  -- 결제정보 삭제
  *****************************************************************************/
  PROCEDURE p_DeleteRtre0050 (
    v_Ord_No        IN RTRE0050.ORD_NO%TYPE,          /*계약번호              */
    v_Del_Tp        IN RTRE0050.DEL_YN%TYPE,          /*삭제가능여부          */    
    v_Reg_Id        IN RTRE0050.REG_ID%TYPE,          /*사용자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 결제정보 삭제 FUNCTION
  *****************************************************************************/
  FUNCTION f_DeleteTpRtre0050 (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*계약번호               */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
      
  /*****************************************************************************
  -- 고객 카드 정보 - 결제변경요청순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050RpcSeq RETURN NUMBER;


  
  /*****************************************************************************
  -- 결제정보 변경이력 - 주문번호 기준  최종변경이력의  변경전 계좌해지 신청 처리상태 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050FinalBfacrqSt(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*주문번호              */
    ) RETURN VARCHAR;
    
    
  /*****************************************************************************
  -- 결제정보 변경이력 - 주문번호 기준  최종변경이력의  변경후 계좌신청 처리상태
  *****************************************************************************/
  FUNCTION f_sRtre0050FinalAfacrqSt(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*주문번호              */
    ) RETURN VARCHAR; 


  /*****************************************************************************
  -- 결제정보 변경이력 - 변경전 계좌해지 신청 처리상태 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050BfacrqSt(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_RpcAcc_Yn      IN RTRE0050.DEL_YN%TYPE,         /*결제계좌 변경여부     */
    v_RpcDay_Yn      IN RTRE0050.DEL_YN%TYPE          /*결제일 변경여부       */
    ) RETURN VARCHAR;
   
  /*****************************************************************************
  -- 결제정보 변경이력 - 변경후 계좌신청 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050AfaccStat(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_RpcAcc_Yn      IN RTRE0050.DEL_YN%TYPE,         /*결제계좌 변경여부     */
    v_RpcDay_Yn      IN RTRE0050.DEL_YN%TYPE,         /*결제일 변경여부       */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */     
    v_Afacc_Stat     OUT RTRE0050.AFACC_STAT%TYPE,    /*변경후 계좌신청 상태  */
    v_Afacrq_St      OUT RTRE0050.AFACRQ_ST%TYPE      /*변경후 계좌신청 처리상*/
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 결제정보 변경이력 - 변경후 계좌신청 발생구분/처리일/순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050AfacrqFgDaySeq(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,          /*변경사유코드          */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*계좌신청 처리일       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,        /*계좌신청 순번         */
    v_Afacrq_Fg      OUT RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     OUT RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     OUT RTRE0050.AFACRQ_SEQ%TYPE      /*변경후 계좌신청 순번  */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결제정보 변경이력 - 계약번호 기준 삭제되지 않은 결제변경요청순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050RpcSeq(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*계약번호               */
    ) RETURN NUMBER;    



  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌해지건 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050Terminate (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*변경전 계좌해지 신청  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  
  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌신청건 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050Application (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*변경후 계좌신청 순번  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌신청 결과처리 상태값(변경후) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050AfterResult (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*변경후 계좌신청 상태  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*변경후 계좌신청 처리상*/
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌신청 결과처리 상태값(변경후)  Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050BeforeResult (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */   
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*변경전 계좌해지 신청  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0050;
/
