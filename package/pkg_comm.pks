CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Comm AS
/*******************************************************************************
   NAME:      Pkg_COMM
   PURPOSE   [COMM] 공통함수

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-12-15  kst             1. Created this package body.
   1.1        2025-05-30  10244015         [20250530_01] 계약만료고객 마지막 청구일자 SMS 메시지 내용 추가
*******************************************************************************/

  /*****************************************************************************
  -- [COMM] 로그내역 INSERT
  *****************************************************************************/
  PROCEDURE p_IRtCommOrdDelLog (
    v_Ord_No         IN VARCHAR2,                       /*계약번호              */
    v_Table_Nm       IN VARCHAR2,                       /*테이블명              */
    v_Col_Nm         IN VARCHAR2,                       /*컬럼명                */
    v_User_Id        IN VARCHAR2                        /*사용자ID              */
  );
  
  /*****************************************************************************
  -- [COMM] 장착계약삭제
  *****************************************************************************/  
  PROCEDURE p_IRtCommOrdDel (
    v_Ord_No         IN VARCHAR2,                       /*계약번호              */
    v_User_Id        IN VARCHAR2,                       /*사용자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- [COMM] 로그내역 복구
  *****************************************************************************/
  PROCEDURE p_IRtCommOrdDelRedo (
    v_Ord_No         IN VARCHAR2,                       /*계약번호              */
    v_Table_Nm       IN VARCHAR2                       /*테이블명              */
  );
  
  /*****************************************************************************
  -- 수납 내역 관리 - 수납취소처리:수납내역생성처리
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030Cancel (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*수납거래번호          */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
  
  /*****************************************************************************
  -- 서비스 원복 처리
  *****************************************************************************/
  PROCEDURE p_IRtCommSvcRollBack (
    v_Ord_No            IN RTCS0007.ORD_NO%TYPE,
    v_Prs_Dcd           IN RTCS0008.SERVICE_CD%TYPE,
    v_Serv_Seq           IN RTCS0007.SERV_SEQ%TYPE,
    v_User_Id           IN RTCS0007.REG_ID%TYPE,
    v_Success_code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );
  
  PROCEDURE p_sReRentalInfo (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Cust_No           IN VARCHAR2,
    v_Safe_Key          IN VARCHAR2,
    v_Success_code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );
  
  PROCEDURE p_sReRentalList (
    Ref_Cursor            IN OUT SYS_REFCURSOR,
    v_ProcDayF            IN RTSD0108.PROC_DAY%TYPE,
    v_ProcDayT            IN RTSD0108.PROC_DAY%TYPE,
    v_OsDayF              IN RTSD0108.OS_DAY%TYPE,
    v_OsDayT              IN RTSD0108.OS_DAY%TYPE,
    v_OrdDayF             IN RTSD0108.ORD_DAY%TYPE,
    v_OrdDayT             IN RTSD0108.ORD_DAY%TYPE,    
    v_ChanCd              IN RTSD0108.CHAN_CD%TYPE,
    v_CarNo               IN RTSD0108.CAR_NO%TYPE,
    v_OrdNo               IN RTSD0108.ORD_NO%TYPE,    
    v_CustNm              IN RTSD0100.CUST_NM%TYPE,
    v_MobNo               IN RTSD0100.MOB_NO%TYPE,
    v_ProvsnSt            IN RTSD0121.PROVSN_ST%TYPE,
    v_ProvsnStDtl         IN RTSD0121.PROVSN_ST_DTL%TYPE,
    v_AreaNm              IN RTSD0100.ADDR1%TYPE,
    v_ProvsnNo            IN RTSD0121.PROVSN_NO%TYPE, 
    v_RecallDay           IN RTSD0122.RECALL_DAY%TYPE   
  );
  
  FUNCTION f_sReRentalOrdNo (    
    v_Cust_No           IN VARCHAR2,
    v_Safe_Key          IN VARCHAR2
  ) RETURN VARCHAR2;
  
  PROCEDURE p_URtre0100Backup (
    v_Cust_No              IN VARCHAR2,
    v_Success_code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
  );
  
  PROCEDURE p_URtre0100RollBack (
    v_Cust_No              IN VARCHAR2,
    v_Success_code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
  );
  
  PROCEDURE p_CreateVisitCheckList (
    v_Ord_No          IN VARCHAR2,
    v_Std_Ym          IN VARCHAR2,
    v_Plan_Day        IN VARCHAR2,
    v_Mr_Cd           IN VARCHAR2,
    v_User_Id         IN VARCHAR2
  );  
  
  PROCEDURE p_VisitCheckRollBack (
    v_Ord_No          IN VARCHAR2,
    v_Std_Ym          IN VARCHAR2,
    v_User_Id         IN VARCHAR2,
    v_Success_code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 홈쇼핑 가계약 등록(IUD)
  -- 2017.12.22 K.S.T. - 최초작성
   --2020.07.16 K.S.T - 사용하지 않음
  *****************************************************************************/
  PROCEDURE p_IUDHomeProvisionalTemp (
    v_Comm_Dvsn            IN CHAR,                         /*처리구분(I,U,D)       */
    v_Col_01               IN VARCHAR2,
    v_Col_02               IN VARCHAR2,
    v_Col_03               IN VARCHAR2,
    v_Col_04               IN VARCHAR2,
    v_Col_05               IN VARCHAR2,
    v_Col_06               IN VARCHAR2,
    v_Col_07               IN VARCHAR2,
    v_Col_08               IN VARCHAR2,
    v_Col_09               IN VARCHAR2,
    v_Col_10               IN VARCHAR2,
    v_Col_11               IN VARCHAR2,
    v_Col_12               IN VARCHAR2,
    v_Col_13               IN VARCHAR2,
    v_Col_14               IN VARCHAR2,
    v_Col_15               IN VARCHAR2,
    v_Col_16               IN VARCHAR2,
    v_Col_17               IN VARCHAR2,
    v_Col_18               IN VARCHAR2,
    v_Col_19               IN VARCHAR2,
    v_Col_20               IN VARCHAR2,
    v_Col_21               IN VARCHAR2,
    v_Col_22               IN VARCHAR2,
    v_Col_23               IN VARCHAR2,
    v_Col_24               IN VARCHAR2,
    v_Col_25               IN VARCHAR2,
    v_Col_26               IN VARCHAR2,
    v_Col_27               IN VARCHAR2,
    v_Col_28               IN VARCHAR2,
    v_Col_29               IN VARCHAR2,
    v_Col_30               IN VARCHAR2,
    v_Col_31               IN VARCHAR2,
    v_Col_32               IN VARCHAR2,
    v_Col_33               IN VARCHAR2,
    v_Col_34               IN VARCHAR2,
    v_Col_35               IN VARCHAR2,
    v_Col_36               IN VARCHAR2,
    v_Col_37               IN VARCHAR2,
    v_Col_38               IN VARCHAR2,
    v_Col_39               IN VARCHAR2,
    v_Col_40               IN VARCHAR2,
    v_Col_41               IN VARCHAR2,
    v_Col_42               IN VARCHAR2,
    v_Col_43               IN VARCHAR2,
    v_Col_44               IN VARCHAR2,
    v_Col_45               IN VARCHAR2,
    v_Col_46               IN VARCHAR2,
    v_Col_47               IN VARCHAR2,
    v_Col_48               IN VARCHAR2,
    v_Col_49               IN VARCHAR2,
    v_Col_50               IN VARCHAR2,
    v_Success_Code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 홈쇼핑 가계약 등록
  -- 2018.01.08 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IHomeProvisionalTemp (
    v_Col_01               IN VARCHAR2,
    v_Col_02               IN VARCHAR2,
    v_Col_03               IN VARCHAR2,
    v_Col_04               IN VARCHAR2,
    v_Col_05               IN VARCHAR2,
    v_Col_06               IN VARCHAR2,
    v_Col_07               IN VARCHAR2,
    v_Col_08               IN VARCHAR2,
    v_Col_09               IN VARCHAR2,
    v_Col_10               IN VARCHAR2,
    v_Col_11               IN VARCHAR2,
    v_Col_12               IN VARCHAR2,
    v_Col_13               IN VARCHAR2,
    v_Col_14               IN VARCHAR2,
    v_Col_15               IN VARCHAR2,
    v_Col_16               IN VARCHAR2,
    v_Col_17               IN VARCHAR2,
    v_Col_18               IN VARCHAR2,
    v_Col_19               IN VARCHAR2,
    v_Col_20               IN VARCHAR2,
    v_Col_21               IN VARCHAR2,
    v_Col_22               IN VARCHAR2,
    v_Col_23               IN VARCHAR2,
    v_Col_24               IN VARCHAR2,
    v_Col_25               IN VARCHAR2,
    v_Col_26               IN VARCHAR2,
    v_Col_27               IN VARCHAR2,
    v_Col_28               IN VARCHAR2,
    v_Col_29               IN VARCHAR2,
    v_Col_30               IN VARCHAR2,
    v_Col_31               IN VARCHAR2,
    v_Col_32               IN VARCHAR2,
    v_Col_33               IN VARCHAR2,
    v_Col_34               IN VARCHAR2,
    v_Col_35               IN VARCHAR2,
    v_Col_36               IN VARCHAR2,
    v_Col_37               IN VARCHAR2,
    v_Col_38               IN VARCHAR2,
    v_Col_39               IN VARCHAR2,
    v_Col_40               IN VARCHAR2,
    v_Col_41               IN VARCHAR2,
    v_Col_42               IN VARCHAR2,
    v_Col_43               IN VARCHAR2,
    v_Col_44               IN VARCHAR2,
    v_Col_45               IN VARCHAR2,
    v_Col_46               IN VARCHAR2,
    v_Col_47               IN VARCHAR2,
    v_Col_48               IN VARCHAR2,
    v_Col_49               IN VARCHAR2,
    v_Col_50               IN VARCHAR2
  );
  
  /*****************************************************************************
  -- 홈쇼핑 가계약 삭제
  -- 2018.01.08 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_DHomeProvisionalTemp;
  
  PROCEDURE p_Test;
  
  /*****************************************************************************
  -- 계약만료고객 SMS발송
  -- 2018.07.10 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_SmsAgregate (
    V_SEND_YM           IN VARCHAR2,
    V_SUCCESS_CODE      OUT NUMBER,
    V_RETURN_MESSAGE    OUT VARCHAR2,
    V_ERRORTEXT         OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- RUN SQL
  -- 2020.12.22 K.S.T.
  *****************************************************************************/
  PROCEDURE p_RunSql (
    V_SQL               IN VARCHAR2,
    V_SUCCESS_CODE      OUT NUMBER,
    V_RETURN_MESSAGE    OUT VARCHAR2,
    V_ERRORTEXT         OUT VARCHAR2
  );
  
END Pkg_COMM;