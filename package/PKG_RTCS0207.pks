CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0207 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0010
   PURPOSE   마모파손서비스 부여 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-10-05  kstka            1. Created this package body.
*******************************************************************************/
   
  /*****************************************************************************
  -- 마모파손보증 신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0207Count(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,          /*배송신청일자        */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE          /*순번                */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 마모파손 보증서비스 신청 내역
  *****************************************************************************/
  PROCEDURE p_sRtcs0207SelectList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Dlvr_Day_F     IN RTCS0207.DLVR_DAY%TYPE,       /*신청일자 From         */
    v_Dlvr_Day_T     IN RTCS0207.DLVR_DAY%TYPE,       /*신청일자 To           */
    v_Proc_Day_F     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자 From         */
    v_Proc_Day_T     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자 To           */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널코드              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*신청상태              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE          /*사용자아이디           */
    );
      
  /*****************************************************************************
  -- 마모파손보증서비스 부여회차 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.0        2020-10-05  kstka            [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207ReqNo (
      v_Ord_No      IN RTCS0207.ORD_NO%TYPE     /* 계약번호 */
    , v_Dlvr_Type   IN RTCS0207.DLVR_TYPE%TYPE  /* 서비스유형 */ 
    , v_Dlvr_Day    IN RTCS0207.DLVR_DAY%TYPE   /* 배송신청일자 */  
    , v_Dlvr_Seq    IN RTCS0207.DLVR_SEQ%TYPE   /* 배송신청순번 */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 마모파손보증서비스 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-23  kstka             [20201023_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207DlvrYn(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,          /*계약번호              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE         /*계약번호              */
    ) RETURN VARCHAR2;
    
  /*****************************************************************************
  -- 마모파손보증서비스 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-23  kstka             [20201023_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207ServAdSeq(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,               /*계약번호              */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,            /*계약번호              */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE               /*계약번호              */
    ) RETURN VARCHAR2;
    
  /*****************************************************************************
  -- 마모파손보증서비스 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207DlvrSeq(
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 마모파손보증 부여내역 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_InsertRtcs0207 (
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*서비스코드            */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*서비스순번            */
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0207.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0207.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0207.KWMENG%TYPE,         /*타이어본수             */
    v_Req_Day        IN RTCS0207.REQ_DAY%TYPE,        /*신청일자              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항             */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0207.DLV_TEL%TYPE,        /*연락처               */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 마모파손보증 부여내역 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0207 (
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태코드              */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리              */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 마모파손보증 부여내역 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0207 (
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 마모파손서비스 부여내역 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2020-10-14  wjim             [20201014-0001]                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0207 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Dlvr_Seq       IN OUT RTCS0207.DLVR_SEQ%TYPE,   /*서비스순번            */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*서비스코드            */
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0207.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0207.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0207.KWMENG%TYPE,         /*타이어본수             */
    v_Req_Day        IN RTCS0207.REQ_DAY%TYPE,        /*신청일자              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항             */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0207.DLV_TEL%TYPE,        /*연락처               */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*등록자               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
    /*****************************************************************************
  -- 쇼핑몰 마모파손서비스 가입/신청가능여부 정보획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-11-09  kstka             [20201109_01] 신규 생성
  *****************************************************************************/
  PROCEDURE p_sGetInitInfo(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE               /*계약번호              */
    );
  
  /*****************************************************************************
  -- 쇼핑몰 마모파손서비스 가입/신청가능여부 정보획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-11-09  kstka             [20201109_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sGetService(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE               /*계약번호              */
    ) RETURN VARCHAR;
 
 /*****************************************************************************
  -- 가입시 SMS 발송
  *****************************************************************************/
 PROCEDURE p_regiSendSms (
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호              */
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*주문일자              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*순번                 */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 장착시시 보증서비스 SMS 발송
  *****************************************************************************/
 PROCEDURE p_warrantySendSms (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
 );
  
   /*****************************************************************************
  -- SMS 발송 (batch)
  *****************************************************************************/
 PROCEDURE p_batchSms (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
      
END Pkg_Rtcs0207;
/