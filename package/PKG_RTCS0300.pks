CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0300 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0300
   PURPOSE   ���� ������ ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-07-18  kstka           Created. [20230718_01]   
*******************************************************************************/
  
  /*****************************************************************************
  -- ���� ������ ���� ��ȸ
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0300 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_Id        IN RTCS0300.CALL_ID%TYPE,          /*���� ID                        */
    v_Provsn_Tp      IN RTCS0300.PROVSN_TP%TYPE,        /*�Ҽӱ׷� P:�����, H:Ȩ����, R:�緻Ż*/
    v_Holi_Yn        IN RTCS0300.HOLI_YN%TYPE,          /*�޹�����                        */
    v_Use_Yn         IN RTCS0300.USE_YN%TYPE            /*��뿩��                        */
    );  
  
 /*****************************************************************************
  -- ���� ��� ���� Ȯ��
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0300Count (
    v_Call_Id        IN RTCS0300.CALL_ID%TYPE           /*���� ID                        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� ������ ���� INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                          
  *****************************************************************************/
  FUNCTION f_InsertRtcs0300 (
    v_Call_Id         IN RTCS0300.CALL_ID%TYPE,        /*���� ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*�����          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*����׷�        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*�޹�����          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*��뿩��          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*�����            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ������ ���� UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                  
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0300 (
     v_Call_Id         IN RTCS0300.CALL_ID%TYPE,        /*���� ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*�����          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*����׷�        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*�޹�����          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*��뿩��          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*�����            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ���� ������ ���� (IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0300 (
    v_Comm_Dvsn       IN CHAR,                         /*1 ó������(I,U,D)       */
    v_Call_Id         IN RTCS0300.CALL_ID%TYPE,       /*���� ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*�����          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*����׷�        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*�޹�����          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*��뿩��          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*�����            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtcs0300;
/