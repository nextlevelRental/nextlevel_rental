CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0230 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0230
    PURPOSE : �ߵ��ϳ�/���� ������ȸ
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-07  sunq             1. Created this package spec.
 *******************************************************************************/

/*******************************************************************************
 -- �ߵ��ϳ�/���� ������ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0230_fullPayRehisList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Cnc_F_Day  IN RTRE0230.CNC_DAY%TYPE    /* ������� StartDay */
                                           , v_Cnc_T_Day  IN RTRE0230.CNC_DAY%TYPE    /* ������� EndDay */
                                           , v_Ord_No     IN RTRE0230.ORD_NO%TYPE     /* ����ȣ */
                                           , v_Cust_No    IN RTRE0230.CUST_NO%TYPE    /* ����ȣ */
                                           , v_Mfp_Cd     IN RTRE0230.MFP_CD%TYPE     /* ���� */
                                           , v_Mfp_Rsn_Cd IN RTRE0230.MFP_RSN_CD%TYPE /* �ϳ�/�������� */
                                          );

/*******************************************************************************
 -- �ߵ��ϳ����� ä��
 *******************************************************************************/
    FUNCTION f_sRtre0230MfpSeq
    RETURN NUMBER;

/*******************************************************************************
 -- �ߵ��ϳ����� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtsd0230MidFullPymnt(  v_Mfp_Seq        IN  RTRE0230.MFP_SEQ%TYPE      /* �ߵ��ϳ����� */
                                           , v_Ord_No         IN  RTRE0230.ORD_NO%TYPE       /* ����ȣ */
                                           , v_Cust_No        IN  RTRE0230.CUST_NO%TYPE      /* ����ȣ */
                                           , v_Cnc_Day        IN  RTRE0230.CNC_DAY%TYPE      /* ������� */
                                           , v_Recv_Mon       IN  RTRE0230.RECV_MON%TYPE     /* ������� */
                                           , v_Mfp_Cd         IN  RTRE0230.MFP_CD%TYPE       /* �������� */
                                           , v_Proc_Day       IN  RTRE0230.PROC_DAY%TYPE     /* �������� */
                                           , v_Tot_Rent_Amt   IN  RTRE0230.TOT_RENT_AMT%TYPE /* �ѷ�Ż�� */
                                           , v_Recv_Amt       IN  RTRE0230.RECV_AMT%TYPE     /* �����ݾ� */
                                           , v_Pnlt_Amt       IN  RTRE0230.PNLT_AMT%TYPE     /* ����� */
                                           , v_Serv_Amt       IN  RTRE0230.SERV_AMT%TYPE     /* �߰����αݾ� */
                                           , v_Tot_Recv_Amt   IN  RTRE0230.TOT_RECV_AMT%TYPE /* �Ѽ����ݾ� */
                                           , v_Recv_Rt        IN  RTRE0230.RECV_RT%TYPE      /* ȸ���� */
                                           , v_Recp_Pay       IN  RTRE0230.RECP_PAY%TYPE     /* ������� */
                                           , v_Recv_Seq       IN  RTRE0230.RECV_SEQ%TYPE     /* �����ŷ���ȣ */
                                           , v_Mfp_Rsn_Cd     IN  RTRE0230.MFP_RSN_CD%TYPE   /* �ϳ����������ڵ� */
                                           , v_Mfp_Desc       IN  RTRE0230.MFP_DESC%TYPE     /* �ϳ������󼼻��� */
                                           , v_Reg_Id         IN  RTRE0230.REG_ID%TYPE       /* ����� ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          );

/*******************************************************************************
 -- �����ݰ��� Seq ��ȸ
 *******************************************************************************/
    PROCEDURE p_sRtre0035SeqList(  Ref_Cursor       IN OUT SYS_REFCURSOR
                                 , v_Ord_No         IN  RTRE0035.ORD_NO%TYPE  /* ����ȣ */
                                );

/*******************************************************************************
 -- �ߵ��ϳ�ȯ�Ҵ�󳻿���ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0230MfpRfndTrgtList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Recv_Mon IN RTRE0230.RECV_MON%TYPE /* ����� */
                                         , v_Mfp_Cd   IN RTRE0230.MFP_CD%TYPE   /* ����������� */
                                        );

END Pkg_Rtre0230;
/
