CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0421 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0421
    PURPOSE     도착알림문자 발송내역
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 도착알림문자 발송내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0421 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTSD0421.ORD_NO%TYPE                  /*주문번호             */
    , v_Cust_No         IN RTSD0420.CUST_NO%TYPE                 /*고객번호             */
    , v_Ord_Day_F       IN RTSD0104.ORD_DAY%TYPE                 /*접수일자             */
    , v_Ord_Day_T       IN RTSD0104.ORD_DAY%TYPE                 /*접수일자             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE                /*고객번호             */
  );
  
  /*****************************************************************************
  --발송내역 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0421Count(
      v_Ord_No          IN RTSD0421.ORD_NO%TYPE            /*주문번호            */
    , v_Order_Type      IN RTSD0421.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
    ) RETURN NUMBER;
       
  /*****************************************************************************
  -- 도착알림문자발송내역(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0421 (
      v_Comm_Dvsn       IN CHAR                                 /*처리구분(I,U,D)      */
    , v_Ord_No          IN RTSD0421.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0421.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
    , v_Cmp_Msg_Id      IN RTSD0421.CMP_MSG_ID%TYPE             /*발송 ID            */
    , v_Reg_Id          IN RTSD0421.REG_ID%TYPE                  /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 도착알림문자발송내역 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0421 (
      v_Ord_No          IN RTSD0421.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0421.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
    , v_Seq             IN RTSD0421.SEQ%TYPE                    /*순번                */
    , v_Cmp_Msg_Id      IN RTSD0421.CMP_MSG_ID%TYPE             /*발송 ID            */
    , v_Reg_Id          IN RTSD0421.REG_ID%TYPE                  /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER;
    
  /*****************************************************************************
  -- 도착알림문자 발송내역
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-10-13  kstka            [20211013_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_GetSendHist (
      v_Ord_No            IN RTSD0420.ORD_NO%TYPE,                /*주문번호             */
      v_Send_Cnt          IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
  ) RETURN VARCHAR;
     
     
END Pkg_Rtsd0421;
/
