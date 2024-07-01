CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Exif0004 AS
/*******************************************************************************
   NAME:      Pkg_Exif0004
   PURPOSE   외부시스템 인터페이스 - O2O

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-03-11                   1. Created this package body.
*******************************************************************************/
     
   /*****************************************************************************
  -- 거점코드 구분(O2O)
  *****************************************************************************/
   FUNCTION f_sExif0004O2OAgency (
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- 거점코드 - 거래처 코드 조회
  *****************************************************************************/
   PROCEDURE p_sExif0004O2OAgencyInfo (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  );
  
  /*****************************************************************************
  -- tms orderId 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0104TmsOrderId (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Order_Id        IN RTSD0104.TMS_ORDERID%TYPE,         /*상태                  */
    v_Inst_Tm         IN RTSD0104.INST_TM%TYPE,         /*장착시간                  */
    v_Inst_Day       IN RTSD0104.INST_DAY%TYPE,         /*장착예정일자                  */
    v_Oms_OrderNo        IN RTSD0104.OMS_ORDERNO%TYPE,         /*OMS 주문번호                  */
    v_Success_Code      OUT NUMBER
    );
    
    /*****************************************************************************
  -- tms orderId 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0010TmsOrderId (
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*주문번호              */
    v_Order_Id        IN RTCS0010.TMS_ORDERID%TYPE,         /*상태                  */
    v_Inst_Tm         IN RTCS0010.INST_TM%TYPE,         /*장착시간                  */
    v_Inst_Day       IN RTCS0010.INST_DAY%TYPE,         /*장착예정일자                  */
    v_Oms_OrderNo        IN RTCS0010.OMS_ORDERNO%TYPE,         /*OMS 주문번호                  */
    v_Success_Code      OUT NUMBER
    );
    
  /*****************************************************************************
  -- 거점 스케쥴정보
  *****************************************************************************/
   PROCEDURE p_sExif0004O2OAgencyTime (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Proc_Day           IN VARCHAR2,                               /* 장착예정일자 */
      v_Agency_Cd         IN VARCHAR2,                               /* 거점코드 */
      v_Qty                  IN NUMBER,                               /* 타이어 수량 */
      v_Wheel_Yn     IN VARCHAR2                                /* 얼라인먼트 여부 */
  );
  
  /*****************************************************************************
  -- 거점 재고정보
  *****************************************************************************/
   FUNCTION f_sExif0004O2OAgencyStock (
      v_Agency_Cd         IN VARCHAR2,                                /* 거점코드 */
      v_Mat_Cd             IN VARCHAR2                                 /* 제품코드 */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 거점코드 재고 (O2O)
  *****************************************************************************/
  FUNCTION f_sExif0004O2OAgencyStockTot (
      v_Mat_Cd            IN VARCHAR2,
      v_Cnt_Cd            IN NUMBER,
      v_Si_Nm             IN VARCHAR2,
      v_Sgg_Nm           IN VARCHAR2,
      v_Emd_Nm          IN VARCHAR2,
      v_XCoord            IN VARCHAR2,
      v_YCoord            IN VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 장착예정일자
  *****************************************************************************/
  FUNCTION f_sExif0004O2OAgencyProcDay (
      v_Ord_No            IN VARCHAR2                               /* 렌탈주문번호 */
  ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- O2O 거점재고 정보
  *****************************************************************************/
  FUNCTION f_sExif0004O2OStockYn (
      v_Ord_No            IN VARCHAR2                               /* 렌탈주문번호 */   
  ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- O2O 주문상태정보
  *****************************************************************************/
  FUNCTION f_sExif0004O2OOrdTransYn (
      v_Ord_No            IN VARCHAR2,                              /* 렌탈주문번호 */
      v_Ord_Seq           IN VARCHAR2,                              /* 렌탈주문순서 */
      v_Sale_Type         IN VARCHAR2                               /* 주문유형 */
  ) RETURN VARCHAR;
 
   /*****************************************************************************
  -- O2O 배정관련 SMS문구 생성
  *****************************************************************************/
  FUNCTION f_sExif0004O2OMakeSms (
      v_Tmpl_Cd            IN VARCHAR2,                              /* SMS템플릿코드 */
      v_Ord_No              IN VARCHAR2,                              /* 주문번호 */ 
      v_Oms_Order_No     IN VARCHAR2                               /* OMS 주문번호 */
  ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- 배정문자발송 (주문/취소)
  *****************************************************************************/
   PROCEDURE p_sExif0004O2OSendSms (
      v_Tmpl_Cd          IN VARCHAR2,                              /* SMS 템플릿 */
      v_Oms_Order_No  IN VARCHAR2,                               /* 주문번호 */
      v_Reg_Id             IN VARCHAR2,                               /* 주문자 */
      v_Success_Code       OUT NUMBER,                               /* 주문자 */
      v_Return_Message     OUT VARCHAR2,                               /* 주문자 */
      v_ErrorText             OUT VARCHAR2                               /* 주문자 */
  );
  
  /*****************************************************************************
  -- 방문점검 차량 배차지역 여부확인
  *****************************************************************************/
   FUNCTION f_sExif0004O2OCarAreaCheck (
      v_Proc_Day          IN VARCHAR2,                              /* 주문일자 */
      v_Si_Nm             IN VARCHAR2,                              /* 시 */
      v_Sgg_Nm           IN VARCHAR2,                              /* 구 */
      v_Emd_Nm          IN VARCHAR2,                              /* 동 */
      v_ErrorText          OUT VARCHAR2                             
  ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- 제품별 타이어 이미지 획득
  *****************************************************************************/
   FUNCTION f_sExif0004O2OTireImg (
      v_Ord_No          IN VARCHAR2                              /* 주문번호 */                           
  ) RETURN VARCHAR2;
  
END Pkg_Exif0004;
/
