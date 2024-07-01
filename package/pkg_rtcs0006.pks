CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0006 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0006
   PURPOSE   �湮���� �۾����� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-03-28  wjim             [20170324_02] �湮���� ���� ���ñ�� �߰�
   1.3        2017-04-04  wjim             [20170404_02] �ñ����� ��� �ε�� ��ȸ��� �߰�
   1.10       2017-12-20  wjim             [20171220_01] �������� ���ð��� ����ó ������� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �湮���� �۾����� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0006Count(
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,           /*����ȣ            */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,           /*�����ȣ            */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,          /*�۾�����            */
    v_Seq            IN RTCS0006.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾����� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0006 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE             /*����                  */
    );

  /*****************************************************************************
  -- �湮���� �۾����� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*����                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*�ڵ���                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*�����ȣ              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*���ּ�              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian �ڵ�      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*���� X��ǥ            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*���� Y��ǥ            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
 /*****************************************************************************
  -- �湮���� �۾����� ���� Insert 20181217��ȭ v_Real_Mob_No �߰�
  *****************************************************************************/
  FUNCTION f_InsertRtcs0006_New (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*����                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*�ڵ���                */
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*���ڵ���                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*�����ȣ              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*���ּ�              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian �ڵ�      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*���� X��ǥ            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*���� Y��ǥ            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  /*****************************************************************************
  -- �湮���� �۾����� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*����                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*�ڵ���                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*�����ȣ              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*���ּ�              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian �ڵ�      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*���� X��ǥ            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*���� Y��ǥ            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
/*****************************************************************************
  -- �湮���� �۾����� ���� Update 20181217��ȭ v_Real_Mob_No �߰�
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0006_New (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*����                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*�ڵ���                */
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*�� �ڵ���                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*�����ȣ              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*���ּ�              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian �ڵ�      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*���� X��ǥ            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*���� Y��ǥ            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾����� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾����� ���� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN OUT RTCS0006.SEQ%TYPE,        /*����                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*�ڵ���                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*�����ȣ              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*���ּ�              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian �ڵ�      */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�۾�����              */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*�� Ư�̻���         */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �湮���� �۾����� ���� - ���� ��� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0006Seq(
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,           /*���س��            */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,           /*����ȣ            */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,           /*�����ȣ            */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE           /*�۾�����            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �۾����� - �����ȣ(������ȣ) ���� Mr. Roadian �ڵ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0006MrCd(
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE      /*������ȣ              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �����ȣ(������ȣ) ���� Mr. Roadian ���� ��ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-28  wjim             [20170324_02] �ű԰���
  *****************************************************************************/
  PROCEDURE p_sRtcs0006Mr(
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE      /*������ȣ            */
  );
  
  /*****************************************************************************
  -- �ñ����� ��� �ε�� ���� ��ȸ
  -- - �ּ�1 ���·� �Է��ϸ� �Ľ��Ͽ� ��ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-04-04  wjim             [20170404_02] �ñ����� ��� �ε�� ��ȸ��� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtcs0006MrAddr1(
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Addr1          IN RTCS0006.ADDR1%TYPE          /*�ּ�1                */
  );

  /*****************************************************************************
  -- �湮���� �۾����� ���ú��� ����
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-27  wjim             [20170324_02] �ű԰���
   1.10       2017-12-20  wjim             [20171220_01] �ڵ���, ��ȭ��ȣ ������� �߰�
  *****************************************************************************/
  PROCEDURE p_InsertRtcs0006Contact (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*���س��              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*����ȣ              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*�����ȣ              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*�۾�����              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*����                  */    
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*�����ȣ              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*���ּ�              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*���˿�������          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*���˿����ð�          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian �ڵ�      */
    v_Ob_St          IN RTCS0005.OB_ST%TYPE,          /*������              */    
    v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE,      /*��㼼�λ���          */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*�ڵ���                */--[20171220_01]
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*�ڵ���                */--[20181217_01]
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*��ȭ��ȣ              */--[20171220_01]
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*�������˻���          */--[20180419]
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*Ư�̻���              */--[20180419]
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    

END Pkg_Rtcs0006;
/
