CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0141 AS
/*******************************************************************************
    NAME        PKG_RTRE0141
    PURPOSE     ������� ���γ��� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] �ű� ����
*******************************************************************************/

  /*****************************************************************************
  -- ������� ���γ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0141 (
      Ref_Cursor      IN OUT SYS_REFCURSOR
    , v_Rva_Day       IN RTRE0141.RVA_DAY%TYPE     /*��û����                 */
    , v_Rva_Seq       IN RTRE0141.RVA_SEQ%TYPE     /*��û�Ϸù�ȣ             */
  );
    
  /*****************************************************************************
  -- ������� ���γ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0141 (
      v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* ��û����         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* ��û�Ϸù�ȣ     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* ����ȣ         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* ����û������ȣ */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* ����ȣ         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* û������         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* û������         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* û������         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* �����������   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* ����ݾ�         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* ��ü�ݾ�         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* �����ID         */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ������� ���γ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0141 (
      v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* ��û����         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* ��û�Ϸù�ȣ     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* ����ȣ         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* ����û������ȣ */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* ����ȣ         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* û������         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* û������         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* û������         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* �����������   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* ����ݾ�         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* ��ü�ݾ�         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* �����ID         */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ������� ���γ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0141 (
      v_Comm_Dvsn       IN CHAR                     /* ó������(I,U,D) */
    , v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* ��û����         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* ��û�Ϸù�ȣ     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* ����ȣ         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* ����û������ȣ */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* ����ȣ         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* û������         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* û������         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* û������         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* �����������   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* ����ݾ�         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* ��ü�ݾ�         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* �����ID         */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );  
        
END PKG_RtRE0141;
/
