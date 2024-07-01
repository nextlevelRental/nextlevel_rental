CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0001 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0001
   PURPOSE   ����� MASTER ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����� MASTER Count
  *****************************************************************************/
  FUNCTION f_sRtcm0001Count(
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*����� ���̵�       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����� MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*����ڸ�              */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*����� �׷�           */
    );

  /*****************************************************************************
  -- ����� MASTER Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*����ڸ�              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*��й�ȣ              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*�븮�����̵�          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*����                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*����� �׷�           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*���Ұ� ��������     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����� MASTER Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*����ڸ�              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*��й�ȣ              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*�븮�����̵�          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*����                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*����� �׷�           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*���Ұ� ��������     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ����� MASTER Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����� MASTER ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0001 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*����ڸ�              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*��й�ȣ              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*�븮�����̵�          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*����                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*����� �׷�           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*���Ұ� ��������     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �����Master Update -  PassWord Update
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0001PassWord(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*����� ���̵�          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*��й�ȣ               */
    v_Old_Password   IN  RTCM0001.OLD_PASSWORD%TYPE, /*������й�ȣ           */
    v_Reason         IN  RTCM0003.REASON%TYPE,       /*�������               */
    v_Reg_Id         IN  RTCM0001.REG_ID%TYPE,       /*����� ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  -- �����Master Update - ��й�ȣ �ʱ�ȭ
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0001Init(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*����� ���̵�          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*��й�ȣ               */
    v_Reg_Id         IN  RTCM0001.REG_ID%TYPE,       /*����� ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  -- ����� �н����� ����
  *****************************************************************************/
  PROCEDURE p_sPassWordVerification(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*����� ���̵�          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*��й�ȣ               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    );

  /*****************************************************************************
  -- ����� Master ��ȸ- �α��ν� ����� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0001LoginInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN     RTCM0001.USER_ID%TYPE,       /*����� ���̵�      */
    v_Password       IN     RTCM0001.PASSWORD%TYPE,      /*��й�ȣ           */
    v_Local_Ip       IN     VARCHAR2                     /*����PC IP          */
    );    


  /*****************************************************************************
  -- ����� MASTER Update - �α��� �õ�Ƚ�� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001FailCnt (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ����� MASTER Update - �α��� �õ�Ƚ�� �ʱ�ȭ
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001FailCntInit (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ���̵�         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ����� MASTER - ����ھ��̵� ���� ����ڸ� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserNm(
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*����� ���̵�       */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- ����� MASTER - ����ڸ� ���� ����ھ��̵� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserCd(
    v_User_Nm        IN RTCM0001.USER_NM%TYPE           /*����� ��       */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- ����� MASTER - ����ھ��̵� ���� ����� �׷� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserGrp(
    v_User_Id        IN RTCM0001.USER_ID%TYPE         /*����� ���̵�         */
    ) RETURN VARCHAR;
            
END Pkg_Rtcm0001;
/
