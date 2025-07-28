CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0214 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0214
   PURPOSE   [SD] OMS연계 이력 New

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2022-01-25  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [COMM] OMS연계 이력테이블
  *****************************************************************************/
    
  /*****************************************************************************
  -- OMS연계 이력저장 등록(IUD)
  -- 2022.01.25 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0214 (
        v_Comm_Dvsn            IN CHAR,                         /*처리구분(I,U,D)       */
        v_Cust_No               IN RTSD0214.CUST_NO%TYPE,
        v_Send_Url             IN RTSD0214.SEND_URL%TYPE,
        v_Send_Flag            IN RTSD0214.SEND_FLAG%TYPE,
        v_Input_Data           IN RTSD0214.INPUT_DATA%TYPE,
        v_Output_Data          IN RTSD0214.OUTPUT_DATA%TYPE,
        v_Result_Code          IN RTSD0214.RESULT_CODE%TYPE,
        v_Result_Msg           IN RTSD0214.RESULT_MSG%TYPE,
        v_Reg_Id               IN RTSD0214.REG_ID%TYPE,
        v_Success_Code         OUT NUMBER,
        v_Return_Message       OUT VARCHAR2,
        v_ErrorText            OUT VARCHAR2
    ) IS
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN
        p_IRtsd0214(v_Cust_No, v_Send_Url, v_Send_Flag, v_Input_Data, v_Output_Data, v_Result_Code, v_Result_Msg, v_Reg_Id);
    --ELSIF v_Comm_Dvsn = 'D' THEN
        --p_DRtsd0214();
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
  END p_IUDRtsd0214;
    
  /*****************************************************************************
  -- OMS연계 등록
  -- 2022.01.25 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IRtsd0214 (
    v_Cust_No               IN RTSD0214.CUST_NO%TYPE,
    v_Send_Url             IN RTSD0214.SEND_URL%TYPE,
    v_Send_Flag            IN RTSD0214.SEND_FLAG%TYPE,
    v_Input_Data           IN RTSD0214.INPUT_DATA%TYPE,
    v_Output_Data          IN RTSD0214.OUTPUT_DATA%TYPE,
    v_Result_Code          IN RTSD0214.RESULT_CODE%TYPE,
    v_Result_Msg           IN RTSD0214.RESULT_MSG%TYPE,
    v_Reg_Id               IN RTSD0214.REG_ID%TYPE
  ) IS
      
  e_Error    EXCEPTION;
  
  BEGIN
    
    BEGIN
        
        INSERT INTO Rtsd0214 (CUST_NO, SEND_URL, SEND_FLAG, INPUT_DATA, OUTPUT_DATA, RESULT_CODE, RESULT_MSG, REG_ID, REG_DT)
            VALUES (v_Cust_No, v_Send_Url, v_Send_Flag, v_Input_Data, v_Output_Data, v_Result_Code, v_Result_Msg,  v_Reg_Id, SYSDATE);
   
    END;
    
    --COMMIT;
    
  END p_IRtsd0214;
  
  /*****************************************************************************
  -- OMS연계 삭제
  -- 2022.01.25 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_DRtsd0214 IS
  
  BEGIN
        
    DELETE FROM Rtsd0214;
    
    --COMMIT;
    
  END p_DRtsd0214;
  
END Pkg_Rtsd0214;