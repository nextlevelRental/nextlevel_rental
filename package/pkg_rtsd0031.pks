CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0031 AS
/*******************************************************************************
   NAME:      PKG_RTSD0031
   PURPOSE:   단체정보 Spec

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-15  Sean             1. Created this package spec.
*******************************************************************************/
 
  /*****************************************************************************
  -- 단체정보 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031 (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO     RTSD0031.GRP_NO%TYPE,
    v_GRP_NM     RTSD0031.GRP_NM%TYPE
  );

  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
  FUNCTION f_sRTSD0031NextSeq(
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE
    ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- 단체정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0031 (
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE,		  
    v_GRP_NM		     IN RTSD0031.GRP_NM%TYPE,		  
    v_GRP_ST		     IN RTSD0031.GRP_ST%TYPE,		  
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,	
    v_REST_CNT	     IN RTSD0031.REST_CNT%TYPE,	  
    v_GRP_TYPE	     IN RTSD0031.GRP_TYPE%TYPE,	  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,	
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,  
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0031 ( 
    v_GRP_NO		     IN RTSD0031.GRP_NO%TYPE,		  
    v_GRP_NM		     IN RTSD0031.GRP_NM%TYPE,		  
    v_GRP_ST		     IN RTSD0031.GRP_ST%TYPE,		  
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,	
    v_REST_CNT	     IN RTSD0031.REST_CNT%TYPE,	  
    v_GRP_TYPE	     IN RTSD0031.GRP_TYPE%TYPE,	  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,	
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,    
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0031 (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE,		  
    v_GRP_NM		     IN RTSD0031.GRP_NM%TYPE,		  
    v_GRP_ST		     IN RTSD0031.GRP_ST%TYPE,		  
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,	
    v_REST_CNT	     IN RTSD0031.REST_CNT%TYPE,	  
    v_GRP_TYPE	     IN RTSD0031.GRP_TYPE%TYPE,	  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,	
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );  
    
  /*****************************************************************************
  -- 단체찾기 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031GrpAddSelect (
    Ref_Cursor IN OUT SYS_REFCURSOR, 
    v_GRP_NO   IN  RTSD0031.GRP_NO%TYPE,
    v_GRP_NM   IN  RTSD0031.GRP_NM%TYPE
  );  

  /*****************************************************************************
  -- 단체(묶음)해지 (Cancel)
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancel (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,     /* 단체번호 */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* 주문번호 */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* 단체유형 */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* 타이어본수 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* 단체상태 수정여부 */
    v_chk            IN CHAR,                         /* 체크박스 */
    v_restCnt        IN CHAR,                         /* 잔여계약(변경후) */
    v_pkgDcYn        IN CHAR,                         /* 패키지중복할인여부 */
    v_dc_Gb          IN CHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ); 

  /*****************************************************************************
  -- 잔여계약건수
  *****************************************************************************/
  FUNCTION f_sRtsd0031Cnt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE            /* 단체번호            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 최소약정계약건수
  *****************************************************************************/
  FUNCTION f_sRtsd0031MinAgrCnt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE            /* 단체번호            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 타이어본수
  *****************************************************************************/
  FUNCTION f_sRtsd0104TireCnt(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /* 주문번호            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 합계월렌탈료 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0104SumMonAmt(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /* 주문번호            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 잔여계약 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0031RestCnt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE,            /* 단체번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
    v_Reg_Id         IN RTSD0031.REG_ID%TYPE,            /* 등록자 ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체상태 Update(해지)
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0031GrpSt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE,            /* 단체번호            */
    v_Reg_Id         IN RTSD0031.REG_ID%TYPE,            /* 등록자 ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체상태 관리(U)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0031GrpSt(
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE,		  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );  

  /*****************************************************************************
  -- 월렌탈료, 단체번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104MonAmt(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* 단체번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* 등록자 ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- Package 월렌탈료, 단체번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104PkgMonAmt(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* 단체번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,          /* 잔여계약            */
    v_grpSt          IN CHAR,                            /* 단체상태 수정여부    */  
    v_pkgDcYn        IN CHAR,                            /* 패키지중복할인여부   */
    v_chk            IN CHAR,                            /* 체크박스 */  
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* 등록자 ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 기준종료일, 사용여부 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0040StdEndDay(
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE,            /* 주문번호            */
    v_Reg_Id         IN RTSD0040.REG_ID%TYPE,            /* 등록자 ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체해지일 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0032GrpCnclDt(
    v_Grp_No         IN RTSD0032.GRP_NO%TYPE,            /* 단체번호            */
    v_Ord_No         IN RTSD0032.ORD_NO%TYPE,            /* 주문번호            */
    v_Reg_Id         IN RTSD0032.REG_ID%TYPE,            /* 등록자 ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
  FUNCTION f_sRTSD0031NextSeq2(
    v_GRP_NO             IN OUT RTSD0031.GRP_NO%TYPE
    ) RETURN VARCHAR2;  

  /*****************************************************************************
  -- 패키지 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031Package (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO     RTSD0031.GRP_NO%TYPE
  );

  /*****************************************************************************
  -- Package 월렌탈료, 단체번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104PkgMonAmt2(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* 단체번호          */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호          */
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,          /* 잔여계약          */  
    v_grpSt          IN CHAR,                            /* 단체상태 수정여부 */
    v_pkgDcYn        IN CHAR,                            /* 패키지중복할인여부*/
    v_chk            IN CHAR,                            /* 체크박스          */    
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* 등록자 ID         */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 패키지 (묶음)해지 (Cancel)
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancel2 (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,          /* 단체번호 */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* 주문번호 */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* 단체유형 */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* 타이어본수 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* 단체상태 수정여부 */
    v_chk            IN CHAR,                         /* 체크박스 */
    v_restCnt        IN CHAR,                         /* 잔여계약(변경후) */
    v_pkgDcYn        IN CHAR,                         /* 패키지중복할인여부 */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 단체(묶음)해지 (Cancel) 잔여계약본수 이하
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancelGroup (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,          /* 단체번호 */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* 주문번호 */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* 단체유형 */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* 타이어본수 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* 단체상태 수정여부 */
    v_chk            IN CHAR,                         /* 체크박스 */
    v_restCnt        IN CHAR,                         /* 잔여계약(변경후) */
    v_pkgDcYn        IN CHAR,                         /* 패키지중복할인여부 */
    v_dc_Gb          IN CHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- 단체(묶음)해지 추가시 잔여계약본수 이상으로 재 진입시
  *****************************************************************************/
  PROCEDURE p_sRTSD0031AddGroup (
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,                /* 단체번호  */    
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,                    /* 등록자 ID */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
    
END PKG_RTSD0031;
/
