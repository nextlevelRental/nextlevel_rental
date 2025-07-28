CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0115 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0115
   PURPOSE   SAL SO LOG 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-18  jemcarry         1. Created this package body.
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가 
*******************************************************************************/

  /*****************************************************************************
  -- SAL SO LOG Count
  *****************************************************************************/
  FUNCTION f_sRtsd0115Count(
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,           /*계약번호            */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,         /*전송구분            */
    v_Zad_Order      IN VARCHAR                         /*마모파손서비스여부      */ --[20201202_01]
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAL SO LOG Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0115 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_FDay      IN RTSD0115.SEND_DAY%TYPE,       /*송신일자FROM          */
    v_Send_TDay      IN RTSD0115.SEND_DAY%TYPE,       /*송신일자TO            */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- SAL SO LOG Insert
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  FUNCTION f_InsertRtsd0115 (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_Day       IN RTSD0115.SEND_DAY%TYPE,       /*송신일자              */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Req_Text       IN RTSD0115.REQ_TEXT%TYPE,       /*비고                  */    
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR,                      /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사              */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAL SO LOG Update
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0115 (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_Day       IN RTSD0115.SEND_DAY%TYPE,       /*송신일자              */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Req_Text       IN RTSD0115.REQ_TEXT%TYPE,       /*비고                  */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR,                      /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사              */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAL SO LOG 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0115 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_Day       IN RTSD0115.SEND_DAY%TYPE,       /*송신일자              */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Req_Text       IN RTSD0115.REQ_TEXT%TYPE,       /*비고                  */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR,                      /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사              */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

   /*****************************************************************************
  -- SAL SO LOG Update Return Order
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2023-09-18  kstka             [20230918_01] created
  *****************************************************************************/
  FUNCTION f_UpdateReturnOrderInfo (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_R        IN RTSD0115.VBELN_R%TYPE,        /*SAP 취소오더번호       */
    v_Vbeln_D_R      IN RTSD0115.VBELN_D_R%TYPE,      /*SAP 취소오더배송번호    */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtsd0115;
--/