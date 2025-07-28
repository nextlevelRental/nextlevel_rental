CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0208 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0010
   PURPOSE   마모파손서비스 부여/신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-10-05  kstka            1. Created this package body.
   1.1        2025-05-19  10243054         p_sRtcs0208SelectList MFP_YN 추가 [20250519_01]
*******************************************************************************/
   
  /*****************************************************************************
  -- 마모파손보증 신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]
  *****************************************************************************/
  FUNCTION f_sRtcs0208Count(
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE          /*순번                */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 마모파손 보증서비스 신청 내역
  *****************************************************************************/
  PROCEDURE p_sRtcs0208SelectList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0208.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTCS0208.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTCS0208.CAR_NO%TYPE,         /*차량번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Dlvr_Day_F     IN RTCS0208.DLVR_DAY%TYPE,       /*신청일자 From         */
    v_Dlvr_Day_T     IN RTCS0208.DLVR_DAY%TYPE,       /*신청일자 To           */
    v_Proc_Day_F     IN RTCS0208.PROC_DAY%TYPE,       /*장착일자 From         */
    v_Proc_Day_T     IN RTCS0208.PROC_DAY%TYPE,       /*장착일자 To           */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널코드              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*신청상태            */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE          /*사용자아이디           */
    );
  
    /*****************************************************************************
  -- 마모파손보증 신청이력 조회
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2021-07-15  kstka           Created. [20210715_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0208 (
    Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Dlvr_DayF    IN RTCS0208.DLVR_DAY%TYPE       /*배송신청일자FROM      */
    , v_Dlvr_DayT    IN RTCS0208.DLVR_DAY%TYPE       /*배송신청일자TO        */
    , v_Dlv_Stat     IN RTCS0208.DLV_STAT%TYPE       /*상태                  */
    , v_Ord_No       IN RTCS0208.ORD_NO%TYPE         /*계약번호              */
    , v_Cust_No      IN RTCS0208.CUST_NO%TYPE        /*고객코드              */    
    , v_Sales_Office IN RTSD0104.SALES_OFFICE%TYPE   /*지점                  */
    , v_Sales_Group  IN RTSD0104.SALES_GROUP%TYPE    /*지사                  */
    , v_Agency_Cd    IN RTSD0104.AGENCY_CD%TYPE      /*장착 대리점           */
    , v_RENTAL_GROUP  IN VARCHAR2
    , v_RENTAL_OFFICE IN VARCHAR2
    , v_LOGIN_ID      IN VARCHAR2                     /* 로그인ID: 관련항목 범위 지정 */
    , v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
    );
    
   /*****************************************************************************
  -- 마모파손보증 신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0208SumCount(
    v_Ord_No       IN RTCS0208.ORD_NO%TYPE,          /*주문번호        */
    v_Serv_Cd      IN RTCS0208.SERV_CD%TYPE          /*서비스코드      */
    ) RETURN NUMBER;
      
  /*****************************************************************************
  -- 마모파손보증서비스 신청회차 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.0        2020-10-05  kstka            [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0208ReqNo (
      v_Ord_No      IN RTCS0208.ORD_NO%TYPE     /* 계약번호 */
    , v_Dlvr_Type   IN RTCS0208.DLVR_TYPE%TYPE  /* 서비스유형 */ 
    , v_Dlvr_Day    IN RTCS0208.DLVR_DAY%TYPE   /* 배송신청일자 */  
    , v_Dlvr_Seq    IN RTCS0208.DLVR_SEQ%TYPE   /* 배송신청순번 */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 마모파손보증서비스내역 수정여부 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-23  kstka             [20201023_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0208DlvrYn(
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,          /*계약번호              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE         /*계약번호              */
    ) RETURN VARCHAR2;
    
  /*****************************************************************************
  -- 조기마모파손/파손보증 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0208ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 조기마모파손/파손보증 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0208DlvStat (
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자 ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 조기마모파손/파손보증 배송상태 확인 - 배송요청상태만 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0208DlvStat (
    v_Ord_No        IN RTCS0208.ORD_NO%TYPE         /* 주문번호 */
    ) RETURN VARCHAR2;
        
  /*****************************************************************************
  -- 마모파손보증 신청내역 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_InsertRtcs0208 (
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*서비스코드            */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*서비스순번            */
    v_Cust_No        IN RTCS0208.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0208.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0208.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0208.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0208.KWMENG%TYPE,         /*타이어본수             */
    v_ServRq_Day     IN RTCS0208.SERVRQ_DAY%TYPE,     /*신청일자              */
    v_Proc_Day       IN RTCS0208.PROC_DAY%TYPE,       /*장착일자              */
    v_ServAd_Seq     IN RTCS0208.SERVAD_SEQ%TYPE,     /*부여순번              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0208.DLV_DESC%TYPE,       /*요청사항             */
    v_C_Mileage      IN RTCS0208.C_MILEAGE%TYPE,      /*주행거리             */
    v_Car_No         IN RTCS0208.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0208.DLV_TEL%TYPE,        /*연락처               */
    v_Pos_Cd         IN RTCS0208.POS_CD%TYPE,         /*우편번호               */
    v_Addr1          IN RTCS0208.ADDR1%TYPE,          /*주소               */
    v_Addr2          IN RTCS0208.ADDR2%TYPE,          /*상세주소               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자              */
    v_Apply_Reason   IN RTCS0208.APPLY_REASON%TYPE,   /*신청사유              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
   
  /*****************************************************************************
  -- 마모파손보증 부여내역 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0208 (
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*상태코드              */
    v_C_Mileage      IN RTCS0208.C_MILEAGE%TYPE,      /*주행거리              */
    v_Dlv_Desc       IN RTCS0208.DLV_DESC%TYPE,       /*요청사항              */
    v_Agency_Cd      IN RTCS0208.AGENCY_CD%TYPE,      /*대리점코드             */
    v_ServRq_Day     IN RTCS0208.SERVRQ_DAY%TYPE,     /*장착예정일             */
    v_Pos_Cd         IN RTCS0208.POS_CD%TYPE,         /*우편번호               */
    v_Addr1          IN RTCS0208.ADDR1%TYPE,          /*주소               */
    v_Addr2          IN RTCS0208.ADDR2%TYPE,          /*상세주소               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*교체예정일자          */
    v_Apply_Reason   IN RTCS0208.APPLY_REASON%TYPE,   /*신청사유              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 마모파손보증 부여내역 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0208 (
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 마모파손서비스 신청내역 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2020-10-14  wjim             [20201014-0001]                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0208 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Dlvr_Seq       IN OUT RTCS0208.DLVR_SEQ%TYPE,   /*서비스순번            */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*서비스코드            */
    v_Cust_No        IN RTCS0208.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0208.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0208.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0208.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0208.KWMENG%TYPE,         /*타이어본수             */
    v_ServRq_Day     IN RTCS0208.SERVRQ_DAY%TYPE,     /*신청일자              */
    v_Proc_Day       IN RTCS0208.PROC_DAY%TYPE,       /*장착일자              */
    v_ServAd_Seq     IN OUT RTCS0208.SERVAD_SEQ%TYPE,     /*부여순번              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0208.DLV_DESC%TYPE,       /*요청사항             */
    v_C_Mileage      IN RTCS0208.C_MILEAGE%TYPE,      /*주행거리              */
    v_Car_No         IN RTCS0208.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0208.DLV_TEL%TYPE,        /*연락처               */    
    v_Pos_Cd         IN RTCS0208.POS_CD%TYPE,         /*우편번호               */
    v_Addr1          IN RTCS0208.ADDR1%TYPE,          /*주소               */
    v_Addr2          IN RTCS0208.ADDR2%TYPE,          /*상세주소               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자               */
    v_Apply_Reason   IN RTCS0208.APPLY_REASON%TYPE,   /*신청사유              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
      
    /*****************************************************************************
  -- 신청완료시 SMS 발송
  *****************************************************************************/
 PROCEDURE p_regiSendSms (
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호              */
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*신청일자              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*신청순번              */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
  
  /*****************************************************************************
  -- 마모파손보증 가입률
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2021-10-13  kstka           Created. [20211013_01]                             
  *****************************************************************************/
  FUNCTION f_GetJoinRate (
    v_Day_F       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Day_T       IN RTCS0208.DLVR_DAY%TYPE        /*배송신청일자          */
    ) RETURN VARCHAR;
    
END Pkg_Rtcs0208;