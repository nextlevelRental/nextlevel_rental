CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0160 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0160
    PURPOSE : �������� ����
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-11  ncho             1. Created this package body.
 *******************************************************************************/

/*****************************************************************************
 -- �������� �����׸� ��ȸ
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrptMonList(Ref_Cursor IN OUT SYS_REFCURSOR);

/*****************************************************************************
 -- �����ݾװ��
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntAmtCalc(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* ����ȣ */
                                         , v_Dc_Cd    IN RTSD0025.DC_CD%TYPE   /* �����ڵ� */
                                         , v_Prpt_Mon IN RTSD0025.MAX_CNT%TYPE /* �������� */
                                        );

/*****************************************************************************
 -- ���ο����� ��ȸ
 *****************************************************************************/
    PROCEDURE p_sRtre0160PymntSchdlDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* ����ȣ */
                                           , v_Dc_Cd    IN RTSD0025.DC_CD%TYPE   /* �����ڵ� */
                                           , v_Prpt_Mon IN RTSD0025.MAX_CNT%TYPE /* �������� */
                                          );

/*******************************************************************************
 -- ������û�Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0160PrptSeq

    RETURN NUMBER;

/*******************************************************************************
 -- �������� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0160PrePymntMst(  v_Prpt_Seq       IN  RTRE0160.PRPT_SEQ%TYPE       /* ������û�Ϸù�ȣ */
                                          , v_Ord_No         IN  RTRE0160.ORD_NO%TYPE         /* ����ȣ */
                                          , v_Cust_No        IN  RTRE0160.CUST_NO%TYPE        /* ����ȣ */
                                          , v_Recp_Fg        IN  RTRE0160.RECP_FG%TYPE        /* �������� */
                                          , v_Recp_Pay       IN  RTRE0160.RECP_PAY%TYPE       /* ������� */
                                          , v_Recv_Seq       IN  RTRE0160.RECV_SEQ%TYPE       /* �����ŷ���ȣ */
                                          , v_Recp_Trno      IN  RTRE0160.RECP_TRNO%TYPE      /* ���κ�����������ȣ */
                                          , v_Prpt_Mnct      IN  RTRE0160.PRPT_MNCT%TYPE      /* �������� */
                                          , v_Prpt_Dscn_Rt   IN  RTRE0160.PRPT_DSCN_RT%TYPE   /* ���������� */
                                          , v_Tot_Rnt_Amt    IN  RTRE0160.TOT_RNT_AMT%TYPE    /* �ѷ�Ż�ݾ� */
                                          , v_Tot_Prpt_Dcamt IN  RTRE0160.TOT_PRPT_DCAMT%TYPE /* �����αݾ� */
                                          , v_Tot_Prpt_Amt   IN  RTRE0160.TOT_PRPT_AMT%TYPE   /* ���Կ����ݾ� */
                                          , v_Prpt_Blnc_Amt  IN  RTRE0160.PRPT_BLNC_AMT%TYPE  /* �̳��ݾ� */
                                          , v_Prpt_Sttg_Tmbt IN  RTRE0160.PRPT_STTG_TMBT%TYPE /* ��������ȸ�� */
                                          , v_Prpt_Fnsh_Tmbt IN  RTRE0160.PRPT_FNSH_TMBT%TYPE /* ��������ȸ�� */
                                          , v_Recv_Day       IN  RTRE0160.RECV_DAY%TYPE       /* ������������ */
                                          , v_Reg_Id         IN  RTRE0160.REG_ID%TYPE         /* ����� ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_Error_Text     OUT VARCHAR2
                                         );

/*******************************************************************************
 -- �������� �� Insert
 *******************************************************************************/
   PROCEDURE p_InsertRtre0161PrePymntDtl(  v_Prpt_Seq       IN  RTRE0161.PRPT_SEQ%TYPE       /* ������û�Ϸù�ȣ */
                                         , v_Ord_No         IN  RTRE0161.ORD_NO%TYPE         /* ����ȣ */
                                         , v_Schd_Seq_I     IN  RTRE0161.SCHD_SEQ%TYPE       /* ��������� Insert */
                                         , v_Sale_Amt       IN  RTRE0161.SALE_AMT%TYPE       /* ������ݾ� */
                                         , v_Prpt_Seq_Dcamt IN  RTRE0161.PRPT_SEQ_DCAMT%TYPE /* �������αݾ�(ȸ���� �����) */
                                         , v_Reg_Id         IN  RTRE0161.REG_ID%TYPE         /* ����� ID */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_Error_Text     OUT VARCHAR2
                                        );

/*****************************************************************************
 -- �������μ��� û�������� Update
 *****************************************************************************/
    FUNCTION f_UpdateRtsd0109PrePymnt(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE   /* ����ȣ */
                                      , v_Schd_Seq  IN  RTSD0109.SCHD_SEQ%TYPE /* ��������� */
                                      , v_Sale_Amt  IN  RTSD0109.SALE_AMT%TYPE /* ������ݾ� */
                                      , v_Arre_Amt  IN  RTSD0109.ARRE_AMT%TYPE /* �̳��ݾ� */
                                      , v_Chg_Id    IN  RTSD0109.CHG_ID%TYPE   /* ������ ID */
                                      , v_ErrorText OUT VARCHAR2
                                     )
    RETURN NUMBER;



/*****************************************************************************
 -- �������ο���
 *****************************************************************************/
    FUNCTION f_Rtsd0105PrePymnt(v_Ord_No    IN  RTSD0109.ORD_NO%TYPE) /* ����ȣ */

    RETURN VARCHAR2;
    
/*****************************************************************************
 -- �������ΰ��ɿ��� üũ
 *****************************************************************************/
    FUNCTION f_Rtsd0160PrePymntChk(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE  /* ����ȣ */
                                   , v_Dc_Cd     IN  RTSD0025.DC_CD%TYPE /* ���������ڵ� */

                                )
     RETURN VARCHAR2;        

/*****************************************************************************
 -- ����������ȸ
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePaymentMstList(  Ref_Cursor      IN OUT SYS_REFCURSOR
                                           , v_Prpt_From_Day IN RTRE0160.PRPT_DAY%TYPE /* ��û����(From) */
                                           , v_Prpt_To_Day   IN RTRE0160.PRPT_DAY%TYPE /* ��û����(To) */
                                           , v_Recv_From_Day IN RTRE0160.RECV_DAY%TYPE /* ��������(From) */
                                           , v_Recv_To_Day   IN RTRE0160.RECV_DAY%TYPE /* ��������(To) */
                                           , v_Ord_No        IN RTRE0160.ORD_NO%TYPE   /* ����ȣ */
                                           , v_Cust_No       IN RTRE0160.CUST_NO%TYPE  /* ����ȣ */
                                          );

/*****************************************************************************
 -- ������������ȸ
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePaymentDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTRE0160.ORD_NO%TYPE /* ����ȣ */
                                          );

/*****************************************************************************
 -- �������αݾװ��
 *****************************************************************************/
    PROCEDURE p_sRtre0160prePymntDscntCalc(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTRE0160.ORD_NO%TYPE   /* ����ȣ */
                                           , v_Zfb_Day  IN RTRE0160.PRPT_DAY%TYPE /* ������� */
                                          );

/*****************************************************************************
 -- ���� Update Data ��ȸ
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntUpdateList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                            , v_Ord_No     IN RTRE0160.ORD_NO%TYPE   /* ����ȣ */
                                            , v_Prpt_Seq   IN RTRE0160.PRPT_SEQ%TYPE /* �������� */
                                            , v_Schd_Seq_U IN RTRE0161.SCHD_SEQ%TYPE /* û������ Update */
                                            , v_Schd_Seq_I IN RTRE0161.SCHD_SEQ%TYPE /* û������ Insert */
                                           );

/*****************************************************************************
 -- ���� ��� Update Data ��ȸ
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntCancelList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                            , v_Ord_No   IN RTRE0160.ORD_NO%TYPE   /* ����ȣ */
                                            , v_Prpt_Seq IN RTRE0160.PRPT_SEQ%TYPE /* �������� */
                                           );

/*****************************************************************************
 -- ������Ҹ��� Update
 *****************************************************************************/
    PROCEDURE p_UpdateRtre0160CancelPrpt(  v_Ord_No         IN  RTRE0160.ORD_NO%TYPE        /* ����ȣ */
                                         , v_Prpt_Seq       IN  RTRE0160.PRPT_SEQ%TYPE      /* ��û�Ϸù�ȣ */
                                         , v_Cnc_Rseq       IN  RTRE0160.PRPT_CNC_RSEQ%TYPE /* ������Ұŷ���ȣ */
                                         , v_Reg_Id         IN  RTRE0160.REG_ID%TYPE        /* ����� ID */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_ErrorText      OUT VARCHAR2
                                        );

/*****************************************************************************
 -- ������� �������μ��� ������ȣ Update
 *****************************************************************************/
    FUNCTION f_UpdateRtre0160PrePymnt(  v_Ord_No    IN  RTRE0160.ORD_NO%TYPE   /* ����ȣ */
                                      , v_Recv_Seq  IN  RTRE0160.RECV_SEQ%TYPE /* ������ȣ */
                                      , v_Recp_Trno IN  RTRE0160.RECP_TRNO%TYPE /* �����ŷ���ȣ */
                                      , v_Recv_Day  IN  RTRE0160.RECV_DAY%TYPE /* ������ */
                                      , v_Prpt_Day  IN  RTRE0160.PRPT_DAY%TYPE /* ��������� */
                                      , v_Recp_Pay  IN  RTRE0160.RECP_PAY%TYPE /* ���ι�� */
                                      , v_Chg_Id    IN  RTRE0160.CHG_ID%TYPE   /* ������ ID */
                                      , v_ErrorText OUT VARCHAR2
                                     )
    RETURN NUMBER;

END Pkg_Rtre0160;
/
