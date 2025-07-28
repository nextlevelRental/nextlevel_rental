CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0141 AS
/*******************************************************************************
    NAME        PKG_RTRE0141
    PURPOSE     가상계좌 세부내역 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] 신규 생성
*******************************************************************************/

  /*****************************************************************************
  -- 가상계좌 세부내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0141 (
      Ref_Cursor      IN OUT SYS_REFCURSOR
    , v_Rva_Day       IN RTRE0141.RVA_DAY%TYPE     /*요청일자                 */
    , v_Rva_Seq       IN RTRE0141.RVA_SEQ%TYPE     /*요청일련번호             */
  );
    
  /*****************************************************************************
  -- 가상계좌 세부내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0141 (
      v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* 요청일자         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* 요청일련번호     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* 고객번호         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* 통합청구계약번호 */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* 계약번호         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* 청구순번         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* 청구구분         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* 청구일자         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* 만기계산기준일   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* 매출금액         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* 연체금액         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* 등록자ID         */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 가상계좌 세부내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0141 (
      v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* 요청일자         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* 요청일련번호     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* 고객번호         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* 통합청구계약번호 */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* 계약번호         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* 청구순번         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* 청구구분         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* 청구일자         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* 만기계산기준일   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* 매출금액         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* 연체금액         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* 등록자ID         */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 가상계좌 세부내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0141 (
      v_Comm_Dvsn       IN CHAR                     /* 처리구분(I,U,D) */
    , v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* 요청일자         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* 요청일련번호     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* 고객번호         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* 통합청구계약번호 */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* 계약번호         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* 청구순번         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* 청구구분         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* 청구일자         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* 만기계산기준일   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* 매출금액         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* 연체금액         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* 등록자ID         */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );  
        
END PKG_RtRE0141;