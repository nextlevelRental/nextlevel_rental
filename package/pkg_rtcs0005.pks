CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0005 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0005
   PURPOSE   �湮���� �۾���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-03-24  wjim             [20170324_02] �湮���� ���� ���ñ�� �߰�
   1.2        2017-04-06  wjim             [20170406_01] �ε�Ⱥ� �湮���� ���� Ȯ���Ǽ� ��ȸ��� �߰�
   1.9        2017-06-08  wjim             [20170608_01] �湮���� ���ø�� ��ȸ����(ó������) �߰�
   1.11       2017-08-22  wjim             [20170822_01] �湮���� ���̷� ���θ�� ��û��� ��� �߰�
   1.13       2017-12-12  wjim             [20171212_01] �湮���� ���ø�� ��ȸ���� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �湮���� �۾���� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0005Count(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*����ȣ            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,           /*�����ȣ            */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE           /*�۾�����            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*����ó����(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*ó������              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*��ó������            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*���˿�������(����)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*���˿����ð�(����)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*����ó������          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*����ó���ð�          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�۾�����              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*���� ����           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*�� Ư�̻���         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �湮���� �۾���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*����ó����(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*ó������              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*��ó������            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*���˿�������(����)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*���˿����ð�(����)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*����ó������          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*����ó���ð�          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�۾�����              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*���� ����           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*�� Ư�̻���         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*����ó����(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*ó������              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*��ó������            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*���˿�������(����)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*���˿����ð�(����)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*����ó������          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*����ó���ð�          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�۾�����              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*���� ����           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*�� Ư�̻���         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0005 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN OUT RTCS0005.JOB_SEQ%TYPE,    /*�۾�����              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*��󱸺�              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*����ó����(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*ó������              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*��ó������            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*���˿�������(����)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*���˿����ð�(����)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*����ó������          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*����ó���ð�          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�۾�����              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*���� ����           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*�� Ư�̻���         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �湮���� �۾���� - �۾����� ���
  *****************************************************************************/
  FUNCTION f_sRtcs0005JobSeq(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*����ȣ            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE            /*�����ȣ            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �湮���� �۾���� Select  - �˰� �۾���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0005JobList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE           /*Mr. Roadian�ڵ�       */
    );

  /*****************************************************************************
  -- �湮���� �۾���� Update - �˰� �۾���� ��ȸ-��������-����� ��������
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005Info (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian�ڵ�       */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*�� Ư�̻���         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾���� Select - ���� �۾������ȸ - ó����� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0005Result (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �湮���� �۾���� - ��ó������ ������Ʈ
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0005NpDesc (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Np_Cd          IN RTCS0005.NP_CD%TYPE,          /*��ó���ڵ�            */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*��ó������            */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �湮���� �۾���� Update -  ���� Ȯ�μ� ����Ϸ� ���
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005ServiceSign (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*�۾�����              */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*����ó����(Mr. Roadian*/
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*����ó������          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*����ó���ð�          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�۾�����              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*���� ����           */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾���� - �۾����� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0005ChkStat(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*����ȣ            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,           /*�����ȣ            */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE           /*�۾�����            */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- �湮���� ���ø�� ��ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-24  wjim             [20170324_02] �ű԰���
   1.9        2017-06-08  wjim             [20170608_01] �湮���� ���ø�� ��ȸ����(ó������) �߰�
   1.13       2017-12-12  wjim             [20171212_01] ����ȣ ��ȸ���� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian�ڵ�       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*���س��              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*�����õ�              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*�ñ���                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*����                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*����ó                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*���û���              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*���ü��λ���          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*��������              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*����� ID             */ 
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*ó������              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*����ȣ              */ --[20171212_01]
  );
  
  /*****************************************************************************
  -- �湮���� ���ø�� ��ȸ(�����ٿ�ε��)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-29  wjim             [20170324_02] �ű԰���
   1.9        2017-06-08  wjim             [20170608_01] �湮���� ���ø�� ��ȸ����(ó������) �߰�
   1.13       2017-12-12  wjim             [20171212_01] ����ȣ ��ȸ���� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallExcelList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian�ڵ�       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*���س��              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*�����õ�              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*�ñ���                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*����                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*����ó                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*���û���              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*���ü��λ���          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*��������              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*����� ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*ó������              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*����ȣ              */ --[20171212_01]
  );
  
  /*****************************************************************************
  -- ���� �ε�Ⱥ� �湮���� ���� �Ϸ�Ǽ� ��ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-04-06  wjim             [20170406_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_sRtcs0005MrMonDecideCnt (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian�ڵ�       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*��ȸ���              */
  );
  
  /*****************************************************************************
  -- ���ں� �ε�Ⱥ� �湮���� ���� �Ϸ�� ��ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-04-06  wjim             [20170406_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_sRtcs0005MrDayDecide (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian�ڵ�       */ 
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*��ȸ��                */
  );
  
  /*****************************************************************************
  -- �湮���� ���̷� ���θ�� ��û��� ���
     - ���θ����� ���� ���� ����� ��� �ش� �湮������ ���û��¸� '�Ϸ�-�̺�Ʈ���'���� ����
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.11    2017-08-22  wjim            [20170822_01]
  *****************************************************************************/
  PROCEDURE p_UpdatePromoApply (
      v_Cust_Nm         IN RTSD0100.CUST_NM%TYPE     /* ����        */
    , v_Birth_Day       IN RTSD0100.BIRTH_DAY%TYPE   /* �����������  */
    , v_std_ym_f        IN RTCS0005.STD_YM%TYPE      /* ���θ�� ��� �湮���� ���س��(from) */
    , v_std_ym_t        IN RTCS0005.STD_YM%TYPE      /* ���θ�� ��� �湮���� ���س��(to)   */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- �湮���� ���ø�� ��ȸ(�̷�ȸ������ ����)
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallRglrList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian�ڵ�       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*���س��              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*�����õ�              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*�ñ���                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*����                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*����ó                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*���û���              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*���ü��λ���          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*��������              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*����� ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*ó������              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*����ȣ              */ --[20171212_01]
  );

  /*******************************************************************************
 -- �������� ó����Ȳ Select
 *******************************************************************************/
  PROCEDURE p_sRtcs0005RegisterProcStat (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_std_Ym         IN RTCS0005.STD_YM%TYPE              /*�⵵��           */
  );

END Pkg_Rtcs0005;
/
