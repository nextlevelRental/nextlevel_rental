CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0105 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0105
   PURPOSE   계약 정보 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count(
    v_Ord_No         IN RTSD0105.ORD_NO%TYPE,           /*주문번호            */
    v_Seq            IN RTSD0105.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0105 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0105.ORD_NO%TYPE          /*주문번호              */
    );

  /*****************************************************************************
  -- 계약 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0105 (
    v_Ord_No         IN RTSD0105.ORD_NO%TYPE,         /*계약번호              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 패키지 묶음 저장
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0105SaveOrder (
    v_Grp_No          IN OUT RTSD0031.GRP_NO%TYPE,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id             IN RTSD0031.REG_ID%TYPE,    
    v_dc_Gubun          IN RTSD0031.GRP_ST%TYPE,
    v_dc_Cd             IN RTSD0040.DC_CD%TYPE,
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    
    );
    
  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count2(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE           /*주문번호            */
   
    ) RETURN NUMBER;  
    
    
  /*****************************************************************************
  -- 계약 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0105TopSearch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,          /*주문번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE           /*계약번호            */
    );
    
  /*****************************************************************************
  -- 할인율
  *****************************************************************************/
  FUNCTION f_sRtsd0105Rate2(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,           /*주문번호            */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE             /*할인코드            */   
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- 할인금액
  *****************************************************************************/
  FUNCTION f_sRtsd0105Amt(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,           /*주문번호            */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE             /*할인코드            */   
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  --  합계월렌탈료
  *****************************************************************************/
  FUNCTION f_sRtsd0105SumAmt(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 월렌탈료
  *****************************************************************************/
  FUNCTION f_sRtsd0105MonAmt(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
   ) RETURN NUMBER;

    
  /*****************************************************************************
  -- 할인 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count3(
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */   
    ) RETURN NUMBER;      
    
  /*****************************************************************************
  -- 할인 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Seq2(
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */   
    ) RETURN NUMBER;   
    
    
  /*****************************************************************************
  -- 단체번호 찾기
  *****************************************************************************/
  FUNCTION f_sRtsd0105SearchGrp(
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count4(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;    
    
    
  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
 PROCEDURE p_sRTSD0031NextSeq3 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,   
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    );

  /*****************************************************************************
  -- 패키지정보
  *****************************************************************************/
 PROCEDURE p_sRtsd0105_restCnt (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );

   
  /*****************************************************************************
  -- 계약별 할인 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0047Contractdc (
    v_ORD_NO             IN RTSD0047.ORD_NO%TYPE,
    v_GRP_NO             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd             IN RTSD0047.DC_CD%TYPE,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 할인이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0040Contractdc (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd             IN RTSD0040.DC_CD%TYPE,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0032Count(
    v_Ord_No         IN RTSD0032.ORD_NO%TYPE,           /*주문번호            */
    v_Grp_No         IN RTSD0032.GRP_NO%TYPE           /*주문번호            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0047DeletePackage(
    v_Ord_No         IN RTSD0032.ORD_NO%TYPE,           /*주문번호            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 계약별 할인 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0047Contractdc2 (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;     
    
  /*****************************************************************************
  -- 계약별 할인이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0040Contractdc2 (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 단체 해지시 계약별 할인 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0047CancelGroup (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Gb          IN CHAR,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체 해지시 계약별 할인이력 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0040CancelGroup (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Gb          IN CHAR,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;   
    

END Pkg_Rtsd0105;
/
