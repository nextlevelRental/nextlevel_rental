CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0215 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0215
   PURPOSE   [SD] OMS reassign 변경 log내역

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2022-01-20  kstka            1. Created this package body.
*******************************************************************************/
      
  /*****************************************************************************
  -- 변경이력내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-01-20  kstka            [20220120_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0215 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Input_Day_F     IN RTSD0215.INPUT_DAY%TYPE               /*이력발생일자         */
    , v_Input_Day_T     IN RTSD0215.INPUT_DAY%TYPE               /*이력발생일자         */
    , v_Agency_Diff_Yn  IN RTSD0215.AGENCY_DIFF_YN%TYPE          /*대리점코드 변경여부   */
  );
  
  /*****************************************************************************
  -- 변경이력저장
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_ReCreateRental (
      v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Agency_Cd_Bf  RTSD0215.AGENCY_CD_BF%TYPE
    , v_Agency_Cd_Af  RTSD0215.AGENCY_CD_AF%TYPE
    , v_Oms_Orderno   RTSD0215.OMS_ORDERNO%TYPE    
    , v_Tms_Orderid   RTSD0215.TMS_ORDERID%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 변경이력저장
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IRtsd0215 (
      v_Comm_Dvsn     CHAR
    , v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Ord_No_New    RTSD0215.ORD_NO%TYPE
    , v_Seq           OUT NUMBER
    , v_Agency_Cd_Bf  RTSD0215.AGENCY_CD_BF%TYPE
    , v_Agency_Cd_Af  RTSD0215.AGENCY_CD_AF%TYPE
    , v_Inst_Day      RTSD0215.INST_DAY%TYPE
    , v_Inst_Tm       RTSD0215.INST_TM%TYPE
    , v_Oms_Orderno   RTSD0215.OMS_ORDERNO%TYPE    
    , v_Tms_Orderid   RTSD0215.TMS_ORDERID%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

  FUNCTION f_sRtcs0215Seq(
    v_Ord_No       IN RTSD0215.ORD_NO%TYPE          /*주문번호        */
    ) RETURN NUMBER;
    
  FUNCTION f_InsertRtsd0215 (
      v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Seq           RTSD0215.SEQ%TYPE
    , v_Agency_Cd_Bf  RTSD0215.AGENCY_CD_BF%TYPE
    , v_Agency_Cd_Af  RTSD0215.AGENCY_CD_AF%TYPE
    , v_Inst_Day      RTSD0215.INST_DAY%TYPE
    , v_Inst_Tm       RTSD0215.INST_TM%TYPE
    , v_Oms_Orderno   RTSD0215.OMS_ORDERNO%TYPE    
    , v_Tms_Orderid   RTSD0215.TMS_ORDERID%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 변경이력정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-01-20  kstka            [20220120_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0215 (
      v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Seq           RTSD0215.SEQ%TYPE
    , v_Ord_No_New    RTSD0215.ORD_NO_NEW%TYPE
    , v_Conf_Yn       RTSD0215.CONF_YN%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 취소후 재등록 프로세스 batch
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0215ReassignBatch (
    v_Day_F          VARCHAR2,
    v_Day_T          VARCHAR2,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  );
  
  /*****************************************************************************
  -- 취소후 재등록 프로세스
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0215CancRegister (
    v_Ord_No_Old     IN RTSD0104.ORD_NO%TYPE,
    v_Ord_No_New     OUT RTSD0104.ORD_NO%TYPE,
    v_Seq            IN RTSD0215.SEQ%TYPE,
    v_Agency_Cd_New  IN RTSD0215.AGENCY_CD_AF%TYPE,
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  );
  
  /*****************************************************************************
  -- 취소후 재등록 프로세스
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0104CancRegister1 (
    v_Ord_No_Old     IN RTSD0104.ORD_NO%TYPE,
    v_Seq            IN RTSD0215.SEQ%TYPE,
    v_Agency_Cd_New  IN RTSD0215.AGENCY_CD_AF%TYPE,
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  );
  
END Pkg_Rtsd0215;
/
