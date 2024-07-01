CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0204 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0204
   PURPOSE   [CS] ���ͱ�ü����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-12-08  K.S.T.           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] ���ͱ�ü�����Է�(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0204 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTCS0204.ORD_NO%TYPE,         /*����ȣ              */
    v_Input_Dt       IN RTCS0204.INPUT_DT%TYPE,       /*��üȮ�μ��ۼ�����    */
    v_Prs_Dcd        IN RTCS0204.PRS_DCD%TYPE,        /*�����ڵ�            */
    v_Write_Yn       IN RTCS0204.WRITE_YN%TYPE,       /*�ۼ�����              */
    v_Reg_Id         IN RTCS0204.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );        
  
  /*****************************************************************************
  -- ���ͱ�ü Ȯ�μ� �ۼ�����
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*�ֹ���ȣ            */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- [CS] ���ͱ�üȮ�μ� �ۼ�����
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*����ȣ            */
  ) RETURN VARCHAR2;
        
END Pkg_Rtcs0204;
/
