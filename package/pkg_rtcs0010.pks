CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0010 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0010
   PURPOSE   걱정제로 배송신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-01-15  cleansalmon      1. Created this package body.
   1.3        2017-12-18  wjim             [20171218_02] 걱정제로 배송신청 내역 조회 조회조건 순서변경
   1.8        2019-04-26  wjim             [20180426_01] 걱정제로 신청회차 조회 신규 생성
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
   1.13       2021-11-23  kstka             [20211123_01] 걱정제로 수령건 대응 관련 기능 추가    
*******************************************************************************/

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0010Count(
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE          /*순번                */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Select
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-12-18  wjim             [20171218_02] 조회조건 순서변경 (계약번호-고객번호)
  *****************************************************************************/
  PROCEDURE p_sRtcs0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dlvr_DayF      IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자FROM      */
    v_Dlvr_DayT      IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자TO        */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE ,        /*계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*고객코드              */    
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
  );
  
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
   1.13       2021-11-23  kstka             [20211123_01] 걱정제로 수령건 대응 관련 기능 추가    
  *****************************************************************************/
  FUNCTION f_InsertRtcs0010 (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0010.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0010.AGENCY_CD%TYPE,      /*대리점                */
    v_Matnr          IN RTCS0010.MATNR%TYPE,          /**/
    v_Kwmeng         IN RTCS0010.KWMENG%TYPE,         /**/
    v_Servrq_Day     IN RTCS0010.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Addr1          IN RTCS0010.ADDR1%TYPE,          /*주소                  */
    v_Dlv_Tel        IN RTCS0010.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0010.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTCS0010.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTCS0010.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0010.INST2_ADDR1%TYPE,    /*장착주소2             */ --[2019-00359563]
    v_Car_No         IN RTCS0010.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_Tms_OrderId    IN RTCS0010.TMS_ORDERID%TYPE,         /*TMS ORDER ID              */ --[20200317]
    v_Dlv_Gb         IN RTCS0010.DLV_GB%TYPE,         /*수령여부*/               --[20211122_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0010 (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0010.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0010.AGENCY_CD%TYPE,      /*대리점                */
    v_Matnr          IN RTCS0010.MATNR%TYPE,          /**/
    v_Kwmeng         IN RTCS0010.KWMENG%TYPE,         /**/
    v_Servrq_Day     IN RTCS0010.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Addr1          IN RTCS0010.ADDR1%TYPE,          /*주소                  */
    v_Dlv_Tel        IN RTCS0010.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0010.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTCS0010.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTCS0010.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0010.INST2_ADDR1%TYPE,    /*장착주소2             */ --[2019-00359563]
    v_Car_No         IN RTCS0010.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0010 (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 - 교체신청건수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrCnt(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 걱정제로 서비스완료 내역 - 20160329 한승훈 
  *****************************************************************************/  
  FUNCTION f_sRtcs0010ComplCnt(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrSeq(
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 - 교체신청여부
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrYn(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2;
    
  /*****************************************************************************
  -- 걱정제로일 배송신청 내역 - 배송상태획득
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrStat(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2;
    
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0010ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
   1.13       2021-11-23  kstka             [20211123_01] 걱정제로 수령건 대응 관련 기능 추가    
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0010 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN OUT RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0010.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0010.AGENCY_CD%TYPE,      /*대리점                */
    v_Matnr          IN RTCS0010.MATNR%TYPE,          /**/
    v_Kwmeng         IN RTCS0010.KWMENG%TYPE,         /**/
    v_Servrq_Day     IN RTCS0010.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Addr1          IN RTCS0010.ADDR1%TYPE,          /*주소                  */
    v_Dlv_Tel        IN RTCS0010.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0010.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTCS0010.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTCS0010.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0010.INST2_ADDR1%TYPE,    /*장착주소2             */ --[2019-00359563]
    v_Car_No         IN RTCS0010.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_Tms_OrderId    IN RTCS0010.TMS_ORDERID%TYPE,         /*TMS ORDER ID              */ --[20200317]
    v_Dlv_Gb         IN RTCS0010.DLV_GB%TYPE,         /*수령여부*/               --[20211122_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 엔진오일교체 신청등록 - 조회조건에 맞는 계약정보를 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtcs0010SelectOrderList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE          /*사용자아이디           */
    );
 /*****************************************************************************
  -- 걱정제로 배송 상태 확인- 배송요청상태만 조회  20160419 한승훈 
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvStat(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2;
    
      
  /*****************************************************************************
  -- 걱정제로 배송상태 Update - 배송요청 상태 업데이트20160419 한승훈 
  배송요청(02) -> 배송중(03) , 선처리_배송요청(08) -> 선처리_배송중(09)
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0010DlvStat (
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,          /*계약번호              */
    v_Reg_Id          IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 걱정제로 배송신청 중복내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0010DupCount(
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 걱정제로 신청회차 조회
     - 배송신청일자, 순번이 없는 경우 해당 계약의 신규신청 기준 신청회차 반환
     - 배송신청일자, 순번이 있는 경우 해당 시점 신청회차를 반환하되
       매칭되는 신청 건이 없는 경우 오류로 판단하여 0 반환
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2019-04-26  wjim             [20180426_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0010ReqNo (
      v_Ord_No      IN RTCS0010.ORD_NO%TYPE     /* 계약번호     */
    , v_Dlvr_Day    IN RTCS0010.DLVR_DAY%TYPE   /* 배송신청일자 */  
    , v_Dlvr_Seq    IN RTCS0010.DLVR_SEQ%TYPE   /* 배송신청순번 */
  ) RETURN NUMBER;
    
END Pkg_Rtcs0010;