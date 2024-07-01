CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0420 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0420
    PURPOSE     도착알림문자내역
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 도착알림문자내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*발송일자            */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*중지대상            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제대상            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                 /*등록자            */
    , v_Next_Send_Day   IN RTSD0420.SEND_DAY%TYPE               /*다음발송일자            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*배송유형            */
  );
   
  /*****************************************************************************
  --집계내역 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0420Count(
      v_Ord_No             IN RTSD0420.ORD_NO%TYPE                /*주문번호            */
    , v_Order_Type         IN RTSD0420.ORDER_TYPE%TYPE            /*주문유형            */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 도착알림문자내역 최초집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420Aggregate (
      v_Day_F           IN VARCHAR2                 /*시작일             */
    , v_Day_T           IN VARCHAR2                 /*종료일             */
    , v_Reg_Id          IN VARCHAR2                 /*등록자             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 도착알림문자내역 집계 문자 발송
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420SendMsg (
      v_Send_Day       IN RTSD0420.SEND_DAY%TYPE                 /*시작일             */
    , v_Send_Cnt       IN RTSD0420.SEND_CNT%TYPE
    , v_Reg_Id         IN VARCHAR2
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 도착알림문자내역 최초 집계 문자 발송
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420SendMsg1 (
      v_Send_Day       IN RTSD0420.SEND_DAY%TYPE                 /*시작일             */
    , v_Reg_Id         IN VARCHAR2
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 도착알림문자내역 추가집계 
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420SendMsg2 (
      v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE
    , v_Reg_Id          IN VARCHAR2                 /*등록자             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 도착알림문자내역(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0420 (
      v_Comm_Dvsn      IN CHAR                        /*처리구분(I,U,D)       */
    , v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*발송일자             */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_logistics       IN RTSD0420.LOGISTICS%TYPE              /*택배사             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*발송유형            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제여부            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*발송중지여부            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                  /*등록자 ID             */
    , v_Logistics_Status  IN RTSD0420.LOGISTICS_STATUS%TYPE     /*택배배송상태             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 도착알림문자내역 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0420 (
      v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*발송일자             */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_logistics       IN RTSD0420.LOGISTICS%TYPE              /*택배사             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*발송유형            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제여부            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*발송중지여부            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                  /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER;
  
  /*****************************************************************************
  -- 도착알림문자내역 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0420 (
      v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*집계일자             */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_logistics       IN RTSD0420.LOGISTICS%TYPE              /*택배사             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*발송유형            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제여부            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*발송중지여부            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                 /*등록자 ID             */
    , v_Logistics_Status  IN RTSD0420.LOGISTICS_STATUS%TYPE     /*택배배송상태             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 도착알림문구 생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_MakeSendMsg (
      v_Ord_No            IN RTSD0420.ORD_NO%TYPE,              /*주문번호             */
      v_Sms_Type          IN RTSD0422.SMS_TYPE%TYPE             /*문자유형             */
    , v_ErrorText        OUT VARCHAR2
  ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 도착알림문자내역 집계내역 갱신
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-10-21  kstka            [20211021_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420Renew (
      v_Day_F           IN VARCHAR2                 /*시작일             */
    , v_Day_T           IN VARCHAR2                 /*종료일             */
    , v_Reg_Id          IN VARCHAR2                 /*등록자             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
   
  /*****************************************************************************
  -- 도착알림문자내역 Select (택배건만)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-01  kstka            [20220701_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420ByPost (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Day_F           IN RTSD0420.SEND_DAY%TYPE               /*발송일자            */
    , v_Day_T           IN RTSD0420.SEND_DAY%TYPE               /*발송일자            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                 /*등록자              */ 
  );
    
END Pkg_Rtsd0420;
/
