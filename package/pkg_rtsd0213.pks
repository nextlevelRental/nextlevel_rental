CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0213 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0213
   PURPOSE   [SD] OMS연계 이력

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2019-12-09  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [COMM] OMS연계 이력테이블
  *****************************************************************************/
    
  /*****************************************************************************
  -- OMS연계 이력저장 등록(IUD)
  -- 2019.12.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0213 (
    v_Comm_Dvsn            IN CHAR,                         /*처리구분(I,U,D)       */
    v_Col_01               IN VARCHAR2,
    v_Col_02               IN VARCHAR2,
    v_Col_03               IN VARCHAR2,
    v_Col_04               IN VARCHAR2,
    v_Col_05               IN VARCHAR2,
    v_Col_06               IN VARCHAR2,
    v_Col_07               IN VARCHAR2,
    v_Col_08               IN VARCHAR2,
    v_Col_09               IN VARCHAR2,
    v_Col_10               IN VARCHAR2,
    v_Col_11               IN VARCHAR2,
    v_Col_12               IN VARCHAR2,
    v_Col_13               IN VARCHAR2,
    v_Col_14               IN VARCHAR2,
    v_Col_15               IN VARCHAR2,
    v_Col_16               IN VARCHAR2,
    v_Col_17               IN VARCHAR2,
    v_Col_18               IN VARCHAR2,
    v_Col_19               IN VARCHAR2,
    v_Col_20               IN VARCHAR2,
    v_Col_21               IN VARCHAR2,
    v_Col_22               IN VARCHAR2,
    v_Col_23               IN VARCHAR2,
    v_Col_24               IN VARCHAR2,
    v_Col_25               IN VARCHAR2,
    v_Col_26               IN VARCHAR2,
    v_Col_27               IN VARCHAR2,
    v_Col_28               IN VARCHAR2,
    v_Col_29               IN VARCHAR2,
    v_Col_30               IN VARCHAR2,
    v_Col_31               IN VARCHAR2,
    v_Col_32               IN VARCHAR2,
    v_Success_Code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- OMS연계 등록
  -- 2019.12.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IRtsd0213 (
    v_Col_01               IN VARCHAR2,
    v_Col_02               IN VARCHAR2,
    v_Col_03               IN VARCHAR2,
    v_Col_04               IN VARCHAR2,
    v_Col_05               IN VARCHAR2,
    v_Col_06               IN VARCHAR2,
    v_Col_07               IN VARCHAR2,
    v_Col_08               IN VARCHAR2,
    v_Col_09               IN VARCHAR2,
    v_Col_10               IN VARCHAR2,
    v_Col_11               IN VARCHAR2,
    v_Col_12               IN VARCHAR2,
    v_Col_13               IN VARCHAR2,
    v_Col_14               IN VARCHAR2,
    v_Col_15               IN VARCHAR2,
    v_Col_16               IN VARCHAR2,
    v_Col_17               IN VARCHAR2,
    v_Col_18               IN VARCHAR2,
    v_Col_19               IN VARCHAR2,
    v_Col_20               IN VARCHAR2,
    v_Col_21               IN VARCHAR2,
    v_Col_22               IN VARCHAR2,
    v_Col_23               IN VARCHAR2,
    v_Col_24               IN VARCHAR2,
    v_Col_25               IN VARCHAR2,
    v_Col_26               IN VARCHAR2,
    v_Col_27               IN VARCHAR2,
    v_Col_28               IN VARCHAR2,
    v_Col_29               IN VARCHAR2,
    v_Col_30               IN VARCHAR2,
    v_Col_31               IN VARCHAR2,
    v_Col_32               IN VARCHAR2
  );
  
  /*****************************************************************************
  -- OMS연계 삭제
  -- 2019.12.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_DRtsd0213;
  
END Pkg_Rtsd0213;
/