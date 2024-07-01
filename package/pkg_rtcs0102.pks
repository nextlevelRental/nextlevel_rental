CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0102 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0102
   PURPOSE   �ιٿ�� ����� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �ιٿ�� ����� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0102Count(
    v_Call_No        IN RTCS0102.CALL_NO%TYPE           /*�ιٿ�� ����ȣ   */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� ����� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0102.CALL_NO%TYPE,        /*�ιٿ�� ����ȣ     */
    v_Recv_FDay      IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����FROM          */
    v_Recv_TDay      IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����TO            */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*�����ID(����)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*�ιٿ�� �������     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*ó������              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*����ȣ              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*��ȭ�ð�              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*��㳻��              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*Ŭ���ӹ�ȣ            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*�Ϸ�����              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*�Ϸ�ð�              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE          /*�����ID              */
    );

  /*****************************************************************************
  -- �ιٿ�� ����� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0102 (
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*�ιٿ�� ����ȣ     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*��ȭ�ð�              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*�����ID(����)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*�ιٿ�� �������     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*ó������              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*��㳻��              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*Ŭ���ӹ�ȣ            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*�Ϸ�����              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*�Ϸ�ð�              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS����               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*�����ڵ�              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*�����ڵ�              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*������ȣ              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� ����� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0102 (
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*�ιٿ�� ����ȣ     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*��ȭ�ð�              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*�����ID(����)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*�ιٿ�� �������     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*ó������              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*��㳻��              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*Ŭ���ӹ�ȣ            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*�Ϸ�����              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*�Ϸ�ð�              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS����               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*�����ڵ�              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*�����ڵ�              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*������ȣ              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� ����� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0102 (
    v_Call_No        IN RTCS0102.CALL_NO%TYPE,        /*�ιٿ�� ����ȣ     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*��ȭ�ð�              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*�����ID(����)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*�ιٿ�� �������     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*ó������              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*��㳻��              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*Ŭ���ӹ�ȣ            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*�Ϸ�����              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*�Ϸ�ð�              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� ����� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0102 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*�ιٿ�� ����ȣ     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*��ȭ�ð�              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*�����ID(����)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*�ιٿ�� �������     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*ó������              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*��㳻��              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*Ŭ���ӹ�ȣ            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*�Ϸ�����              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*�Ϸ�ð�              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS����               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*�����ڵ�              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*�����ڵ�              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*������ȣ              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*�����ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0102Ctf (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cust_No       IN RTCS0102.CUST_NO%TYPE,                  /*�ŷ�ó��ȣ   */
    v_Cust_Nm       IN RTCS0102.CUST_NM%TYPE,                  /*����/���θ�*/
    v_Mob_No        IN RTSD0100.MOB_NO%TYPE,                   /*�޴�����ȣ   */
    v_StartDay      IN RTSD0106.PLAN_DAY%TYPE,                 /*����������   */
    v_EndDay        IN RTSD0106.PLAN_DAY%TYPE                  /*����������   */
    );

  /*****************************************************************************
  -- �ƿ��ٿ���㸮��Ʈ  ��ȸ
 *****************************************************************************/
  PROCEDURE p_sRtcs0102Obf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*���ڵ�              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_StartDay      IN RTCS0100.JOB_DAY%TYPE,         /*ó������              */
    v_EndDay        IN RTCS0100.JOB_DAY%TYPE          /*ó������              */
    ) ;

  /*****************************************************************************
  -- �ιٿ���㸮��Ʈ  ��ȸ
 *****************************************************************************/
  PROCEDURE p_sRtcs0102Ibf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*���ڵ�              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*����/���θ�         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*�����ȭ��ȣ          */
    v_StartDay       IN RTCS0102.RECV_DAY%TYPE,       /*��ȭ����              */
    v_EndDay         IN RTCS0102.RECV_DAY%TYPE        /*��ȭ����              */
    );

  /*****************************************************************************
  -- �ιٿ�� ����Ͻð� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0102SelectSysdate
  RETURN VARCHAR;

 /*****************************************************************************
 -- �ιٿ���㸮��Ʈ  ��ȸ - ����Ȳ - �ιٿ����
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis08 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE          /*�����ȭ��ȣ          */
    );

 /*****************************************************************************
 -- �ιٿ���㸮��Ʈ  ��ȸ - ����Ȳ - �ƿ��ٿ����
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis09 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE          /*�ֹ���ȣ              */
    );

 /*****************************************************************************
 -- �ιٿ���㸮��Ʈ  ��ȸ - ����Ȳ - Ŭ��������
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis10 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE          /*�ֹ���ȣ              */
    );
        
END Pkg_Rtcs0102;
/
