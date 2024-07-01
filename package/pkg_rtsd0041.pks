CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0041 AS
/*******************************************************************************
   NAME:      PKG_RTSD0041
   PURPOSE    ��ະ �ΰ����� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-06  pc2288         1. Created this package body.
*******************************************************************************/


  /*****************************************************************************
  -- ��ະ �ΰ���ǰ ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0041 (
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ະ �ΰ���ǰ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0041 (
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0041.SEQ%TYPE,			  /*����				  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*�ΰ���ǰ�ڵ�          */
    v_Amt			 IN RTSD0041.AMT%TYPE,            /*�ݾ�	              */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*���αݾ�              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*�����ݾ�              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*��ǰ��                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*�Һο���              */
	v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*����Ż��              */
	v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ະ �ΰ���ǰ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0041 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0041.SEQ%TYPE,			  /*����				  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*�ΰ���ǰ�ڵ�          */
    v_Amt			 IN RTSD0041.AMT%TYPE,            /*�ݾ�	              */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*���αݾ�              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*�����ݾ�              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*��ǰ��                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*�Һο���              */
	v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*����Ż��              */
	v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ��ະ �ΰ����� ����(IUD) �Ͻú�
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0041Direct (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0041.SEQ%TYPE,              /*����                  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*�ΰ���ǰ�ڵ�          */
    v_Amt             IN RTSD0041.AMT%TYPE,            /*�ݾ�                  */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*���αݾ�              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*�����ݾ�              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*��ǰ��                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*�Һο���              */
    v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*����Ż��              */
    v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
END PKG_RTSD0041;
/
