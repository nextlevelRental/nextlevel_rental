CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0009 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0009
   PURPOSE   �Ⱓ�� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0009Count(
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,            /*��������            */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE           /*�������� ������     */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0009 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Stand_Day      IN RTSD0009.STR_DAY%TYPE         /*������                */
    );

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*������                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*���αݾ�              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*������                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*���αݾ�              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*�������� ������       */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0009 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*������                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*���αݾ�              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Count - �ش� �������� ��ϵ� ���� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0009OrdCount(
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE         /*�������� �Ϸ���       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Count -  ������ ���� ���� ������ �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0009NextCount(
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE         /*�������� ������       */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �Ⱓ�� ���� ���� Update - ���� ������ �Ϸ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0009Before (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*�������� ������       */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ����� - ���αݾװ�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_SELECTrateAmt0009(
    Ref_Cursor			    IN OUT SYS_REFCURSOR,
    v_Mat_Cd                IN RTSD0008.MAT_CD%TYPE,        /*��ǰ�ڵ�        */
    v_Cust_No			    IN RTSD0100.CUST_NO%TYPE,       /*����ȣ		  */
    v_Cnt_Cd			    IN RTSD0008.CNT_CD%TYPE,        /*Ÿ�̾��		 */
    v_Period_Cd			    IN RTSD0008.PERIOD_CD%TYPE,     /*�Ⱓ�ڵ�        */
    v_Rent_Amt			    IN RTSD0008.AMT%TYPE,           /*�ݾ�            */
    v_Ord_Day               IN RtSD0104.ORD_DAY%TYPE        /*��������        */
  );

  /*****************************************************************************
  -- ����� - ���αݾװ�� ����ȸ
  *****************************************************************************/
  PROCEDURE p_SELECTrateAmt0009Detail(
    Ref_Cursor			    IN OUT SYS_REFCURSOR,
    v_Mat_Cd                IN RTSD0008.MAT_CD%TYPE,        /*��ǰ�ڵ�        */
    v_Cust_No			    IN RTSD0100.CUST_NO%TYPE,       /*����ȣ		  */
    v_Cnt_Cd			    IN RTSD0008.CNT_CD%TYPE,        /*Ÿ�̾��		 */
    v_Period_Cd			    IN RTSD0008.PERIOD_CD%TYPE,     /*�Ⱓ�ڵ�        */
    v_Ord_Day               IN RtSD0104.ORD_DAY%TYPE        /*��������        */
  );
  
END Pkg_Rtsd0009;
/
