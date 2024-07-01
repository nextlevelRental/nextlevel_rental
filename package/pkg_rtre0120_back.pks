CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0120_back AS
/*******************************************************************************
   NAME:      Pkg_Rtre0120
   PURPOSE   [RE] �̿���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-16  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [RE] �̿���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0120Count(
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,           /*����ȣ            */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE          /*�̿��׸�            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] �̿���� ���� Count(������ ��ó�� Ȯ�ο�)
  *****************************************************************************/
  FUNCTION f_sRtre0120Pstr_YmCount(
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE        /*�̿��׸�              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- [RE] �̿���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*�̿������            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*�̿��Ⱓ              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*�̿�ó�����ݾ�      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*��������              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*���̿�ó���ݾ�        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*���� �̿�ó���ݾ�     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*ó������              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*�������              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*������              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*��������              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- [RE] �̿���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*�̿������            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*�̿��Ⱓ              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*�̿�ó�����ݾ�      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*��������              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*���̿�ó���ݾ�        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*���� �̿�ó���ݾ�     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*ó������              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*�������              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*������              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*��������              */    
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] �̿���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*�̿������            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*�̿��Ⱓ              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*�̿�ó�����ݾ�      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*��������              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*���̿�ó���ݾ�        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*���� �̿�ó���ݾ�     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*ó������              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*�������              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*������              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*��������              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] �̿���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] �̿���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0120 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*�̿������            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*�̿��Ⱓ              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*�̿�ó�����ݾ�      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*��������              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*���̿�ó���ݾ�        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*���� �̿�ó���ݾ�     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*ó������              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*�������              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*������              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*��������              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] �̿���� ���� ���� ó��
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120Postpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*�̿��Ⱓ              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*�̿�ó�����ݾ�      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*��������              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*ó������              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*�������              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*������              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*��������              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] �������� ��� �̿���� ���� ���� ó��
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ZeroPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*�̿����ۿ�            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*�̿��Ⱓ              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*�̿�ó�����ݾ�      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*��������              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*ó������              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*�������              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*������              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*��������              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
  /*****************************************************************************
  -- [RE] �̿���� �ߵ����� UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120Postpone  (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] �̿���� ���������̿�ó�� UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120SvrPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Ord_Qty_Now    IN RTRE0120.Ord_Qty_Now%TYPE,    /*���� qty  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- [RE] �̿���� �ߵ����� ó��
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangePostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] �̿���� �ߵ����� ó�� Main
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeMain (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ��Ϻ� �̿���� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120RegiPostpone (
    v_Period         IN CHAR,                         /*���                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �����󰢺� �̿���� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120DeprePostpone (
    v_Period         IN CHAR,                         /*���                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �̿�ó�� ������� �ݿ�
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePost (
    v_Period         IN CHAR,                         /*���                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ������ �̿���� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120CommPostpone (
    v_Period         IN CHAR,                         /*���                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �̿�ó�� ������� �ݿ�- ���� �׸��� ��� 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePostSer (
    v_Period         IN CHAR,                         /*���                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [RE] �������� �̿� 02,03 ������ ���� ó��
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeSerPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- [RE] �������� �̿���� �ߵ����� ó�� Main --�ѳ� R
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeMainSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2  
    );  
 /*****************************************************************************
  -- [RE] �������� �̿� 02,03 ������ ���� ó��---------�̰� ��¥��
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangePostponeSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*�̿�������          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*�̿������º�����  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );     
    /*****************************************************************************
  -- �̿�ó�� ������� �ݿ�-- �������� ���� �̿� ����      ������    <���� 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePostSer1 (
    v_Period         IN CHAR,                         /*���                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0120_back;
/
