CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0214 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0214
   PURPOSE   [SD] OMS���� �̷� New

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2022-01-25  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [COMM] OMS���� �̷����̺�
  *****************************************************************************/
    
  /*****************************************************************************
  -- OMS���� �̷����� ��� New(IUD)
  -- 2022.01.25 K.S.T. - �����ۼ�
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0214 (
    v_Comm_Dvsn            IN CHAR,                         /*ó������(I,U,D)       */
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
    );
    
  /*****************************************************************************
  -- OMS���� ���
  -- 2022.01.25 K.S.T. - �����ۼ�
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
  );
  
  /*****************************************************************************
  -- OMS���� ����
  -- 2022.01.25 K.S.T. - �����ۼ�
  *****************************************************************************/
  PROCEDURE p_DRtsd0214;
  
END Pkg_Rtsd0214;
/