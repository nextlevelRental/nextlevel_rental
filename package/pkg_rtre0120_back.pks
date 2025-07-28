CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0120_back AS
/*******************************************************************************
   NAME:      Pkg_Rtre0120
   PURPOSE   [RE] 이연대상 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-16  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [RE] 이연대상 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0120Count(
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,           /*계약번호            */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE          /*이연항목            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연대상 내역 Count(마감월 기처리 확인용)
  *****************************************************************************/
  FUNCTION f_sRtre0120Pstr_YmCount(
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE        /*이연항목              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- [RE] 이연대상 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- [RE] 이연대상 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */    
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연대상 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연대상 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연대상 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0120 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] 이연대상 내역 생성 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120Postpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] 걱정제로 충당 이연대상 내역 생성 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ZeroPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
  /*****************************************************************************
  -- [RE] 이연대상 중도변경 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120Postpone  (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연대상 걱정제로이연처리 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120SvrPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Ord_Qty_Now    IN RTRE0120.Ord_Qty_Now%TYPE,    /*현재 qty  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- [RE] 이연대상 중도변경 처리
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangePostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] 이연대상 중도변경 처리 Main
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeMain (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 등록비 이연대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120RegiPostpone (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 감가상각비 이연대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120DeprePostpone (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 이연처리 변경사항 반영
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePost (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 수수료 이연대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120CommPostpone (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 이연처리 변경사항 반영- 서비스 항목인 경우 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePostSer (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [RE] 걱정제로 이연 02,03 감가상각 변경 처리
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeSerPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- [RE] 걱정제로 이연대상 중도변경 처리 Main --한나 R
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeMainSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2  
    );  
 /*****************************************************************************
  -- [RE] 걱정제로 이연 02,03 감가상각 변경 처리---------이게 진짜임
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangePostponeSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );     
    /*****************************************************************************
  -- 이연처리 변경사항 반영-- 걱정제로 서비스 이연 변경      감가상각    <시작 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePostSer1 (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0120_back;