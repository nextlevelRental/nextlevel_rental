CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0009 AS 
/*******************************************************************************
   NAME:      Pkg_Rtcs0009
   PURPOSE   엔진오일 배송신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-10  jemcarry         1. Created this package body.
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0009Count(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE          /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0009 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dlvr_DayF      IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자FROM      */
    v_Dlvr_DayT      IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자TO        */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,          /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,     /*장착 대리점           */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                     /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  FUNCTION f_InsertRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*유종                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*연식                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*배기량                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*배송구분              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*대리점                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*수취인                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*주소1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*주소2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,        /*차대번호              */    
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery 우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery 주소1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery 주소2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*유종                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*연식                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*배기량                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*배송구분              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*대리점                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*수취인                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*주소1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*주소2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,        /*차대번호              */       
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery 우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery 주소1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery 주소2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0009 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN OUT RTCS0009.DLVR_SEQ%TYPE,   /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*유종                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*연식                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*배기량                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*배송구분              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*대리점                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*수취인                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*주소1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*주소2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,         /*차대번호              */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery 우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery 주소1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery 주소2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009FieldValue(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Field_Nm       IN VARCHAR                       /*필드명                */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrSeq(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 교체신청여부
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrYn(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 교체신청건수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrCnt(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 배송상태 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrStat(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 엔진오일교체 신청등록 - 조회조건에 맞는 계약정보를 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtcs0009SelectOrderList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE          /*휴대폰번호            */
    );

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update - 엔진오일교체 신청내역조회 - 조회된 신청내역에 대하여 엑셀 다운로드시 상태 업데이트 처리 한다.
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009DownDay (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0009ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 엔진오일 교체 신청 내역 송장정보업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009TrspDoc (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN OUT RTCS0009.DLVR_SEQ%TYPE,   /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update - 엔진오일교체 신청내역조회 - 조회된 신청내역에 대하여 엑셀 다운로드시 상태 업데이트 처리 한다.
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009DownDayAll (
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Select - 대상 발취 결과, 다운로드 대상조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0009DownList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,        /*배송신청일자FROM      */
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
    );

END Pkg_Rtcs0009;
/
