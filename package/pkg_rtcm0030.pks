CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0030 AS
/*******************************************************************************
   NAME:       Pkg_Rtcm0030
   PURPOSE:    ��������

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jungsoo         1. Created this package spec.
*******************************************************************************/

  /*****************************************************************************
  -- �������� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0030Count(
    v_Ntc_Seq    IN     RTCM0030.NTC_SEQ%TYPE        /* �������� ����         */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0030 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Reg_Fdt        IN VARCHAR,                      /*�����FROM            */
    v_Reg_Tdt        IN VARCHAR,                      /*�����TO              */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE         /*�ۼ���                */
    );

  /*****************************************************************************
  -- �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0030(
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*��������(�ȳ�/����...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*��������              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*�����Խ� ������       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*�����Խ� ������       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*��ȸ�Ǽ�              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0030(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*��������(�ȳ�/����...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*��������              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*�����Խ� ������       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*�����Խ� ������       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*��ȸ�Ǽ�              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2   
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0030(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0030(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*��������(�ȳ�/����...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*��������              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*�����Խ� ������       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*�����Խ� ������       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*��ȸ�Ǽ�              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- �������� Update - �������� ��ȸ�Ǽ� ������Ʈ
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0030ReadCnt(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
END Pkg_Rtcm0030;
/
