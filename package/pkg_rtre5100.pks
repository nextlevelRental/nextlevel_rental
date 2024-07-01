CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE5100 AS
/*******************************************************************************
    NAME        PKG_RTRE5100
    PURPOSE     �湮���˼����� ���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-25  wjim            �ű��ۼ�
*******************************************************************************/

  /*****************************************************************************
  -- �۾�ȸ�� ä��
  *****************************************************************************/
  FUNCTION f_sRtre5100JobSeq (
      v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*�������            */
  ) RETURN NUMBER;
 
  /*****************************************************************************
  -- ���񽺼����� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5100 (
      v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*�������            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*�۾�ȸ��            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*�������س��        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*����ȣ            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*���������          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*�۾��� ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �湮���˼����� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5100 (
      v_Comm_Dvsn      IN CHAR                          /*ó������(I,U,D)     */
    , v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*�������            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*�۾�ȸ��            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*�������س��        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*����ȣ            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*���������          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*�۾��� ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTRE5100;
/
