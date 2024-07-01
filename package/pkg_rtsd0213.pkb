CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0213 AS
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
    ) IS
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN
        p_IRtsd0213(V_COL_01, V_COL_02, V_COL_03, V_COL_04, V_COL_05, V_COL_06, V_COL_07, V_COL_08, V_COL_09, V_COL_10, 
                               V_COL_11, V_COL_12, V_COL_13, V_COL_14, V_COL_15, V_COL_16, V_COL_17, V_COL_18, V_COL_19, V_COL_20, 
                               V_COL_21, V_COL_22, V_COL_23, V_COL_24, V_COL_25, V_COL_26, V_COL_27, V_COL_28, V_COL_29, V_COL_30,
                               V_COL_31, V_COL_32);
    ELSIF v_Comm_Dvsn = 'D' THEN
        p_DRtsd0213();
    END IF;
    
    v_Success_Code := 0;
    v_Return_Message := '';
    v_ErrorText := '';
    
--    COMMIT;
    
  EXCEPTION
       WHEN OTHERS THEN
        --ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200); 
  END p_IUDRtsd0213;
    
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
  ) IS
      
  e_Error    EXCEPTION;
  
  BEGIN
    
    BEGIN
        
        INSERT INTO RTSD0213 (Col_01, Col_02, Col_03, Col_04, Col_05, Col_06, Col_07, Col_08, Col_09, Col_10,
                              Col_11, Col_12, Col_13, Col_14, Col_15, Col_16, Col_17, Col_18, Col_19, Col_20,
                              Col_21, Col_22, Col_23, Col_24, Col_25, Col_26, Col_27, Col_28, Col_29, Col_30,
                              REG_ID, REG_DT, Col_31, Col_32)
            VALUES (
            v_Col_01, v_Col_02, v_Col_03, v_Col_04, v_Col_05, v_Col_06, v_Col_07, v_Col_08, v_Col_09, v_Col_10,
            v_Col_11, v_Col_12, v_Col_13, v_Col_14, v_Col_15, v_Col_16, v_Col_17, v_Col_18, v_Col_19, v_Col_20,
            v_Col_21, v_Col_22, v_Col_23, v_Col_24, v_Col_25, v_Col_26, v_Col_27, v_Col_28, v_Col_29, v_Col_30,
            v_Col_21, SYSDATE, v_Col_31, v_Col_32);
   
    END;
    
    --COMMIT;
    
  END p_IRtsd0213;
  
  /*****************************************************************************
  -- OMS연계 삭제
  -- 2019.12.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_DRtsd0213 IS
  
  BEGIN
        
    DELETE FROM RTSD0213;
    
    --COMMIT;
    
  END p_DRtsd0213;
  
END Pkg_Rtsd0213;
/