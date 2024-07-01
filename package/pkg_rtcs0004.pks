CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0004 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0004
   PURPOSE   �������� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-04-17  wjim             [20170417_01] �ϰ����� ���μ��� ����
   1.2        2017-04-24  wjim             [20170424_01] �ϰ����� ���౸�� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �������� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0004Count(
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,           /*����ȣ            */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE            /*�����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0004 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*�����ȣ              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*����Ÿ�(����)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*����Ÿ�(�� ���)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*�������� ����ȣ     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �������� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*�����ȣ              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*����Ÿ�(����)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*����Ÿ�(�� ���)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*�������� ����ȣ     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*�����ȣ              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*����Ÿ�(����)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*����Ÿ�(�� ���)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*�������� ����ȣ     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*�����ȣ              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0004 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*�����ȣ              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*����Ÿ�(����)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*����Ÿ�(�� ���)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*�������� ����ȣ     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ���� Update -  ���� Ȯ�μ� ����Ϸ� ���
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0004AMileage (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*�����ȣ              */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*����Ÿ�(�� ���)     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���˴�� ����
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob;
  
  /*****************************************************************************
  -- ���˴�� ����
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregate (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*���س��              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ���� - ����ȣ�� ���س�� ���� �˰˿����� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0004PlanDay(
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- ���˴�� �����踦 ���� ���� ���賻�� �ϰ� ����ó��
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAllDelete (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���˴�� ���� (M-1�� 20��)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob1(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );  
  
  /*****************************************************************************
  -- ���˴�� ���� (M�� 1��)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob2(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- ���˴�� ����2+2 (M-1�� 20��)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob3(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );  
  
  /*****************************************************************************
  -- ���˴�� ����2+2 (M�� 1��)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob4(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  /*****************************************************************************
  -- ���˴�� ���� Ver.2
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] �߰�
   1.2        2017-04-24  wjim             [20170424_01] ���౸�� �߰�
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateNew (
      v_Std_Ym         IN RTCS0004.STD_YM%TYPE         /*���س��              */
    , v_Mode           IN CHAR                         /*���౸�� (A : M-1�� 20�� ����, B : M�� 1�� ����)*/
    , v_Reg_Id         IN RTCS0004.REG_ID%TYPE         /*����� ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

  /*****************************************************************************
  -- ���˴�� ���� Ver.2 2By2
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-03-22  kstka             [20190322_01] �߰�
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregate2By2 (
      v_Std_Ym         IN RTCS0004.STD_YM%TYPE         /*���س��              */
    , v_Mode           IN CHAR                         /*���౸�� (A : M-1�� 20�� ����, B : M�� 1�� ����)*/
    , v_Reg_Id         IN RTCS0004.REG_ID%TYPE         /*����� ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_Rtcs0004;
/
