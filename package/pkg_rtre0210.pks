CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0210 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0210
    PURPOSE : ���������� ������ȸ
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-11-05  ncho             1. Created this package spec.
 *******************************************************************************/

/*******************************************************************************
 -- ���������� ������ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0210_accImmWthdrList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                          , v_Ract_F_Day IN RTRE0210.RACT_DAY%TYPE /* �������� StartDay */
                                          , v_Ract_T_Day IN RTRE0210.RACT_DAY%TYPE /* �������� EndDay */
                                          , v_Ord_No     IN RTRE0210.TORD_NO%TYPE  /* ����û������ȣ */
                                          , v_Cust_No    IN RTRE0210.CUST_NO%TYPE  /* ����ȣ */
                                         );

/*******************************************************************************
 -- �������� ����ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0210_accImmWthdrDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                             , v_Recv_Seq IN RTRE0030.RECV_SEQ%TYPE /* �����ŷ���ȣ */
                                            );
/*******************************************************************************
 -- ���¼����Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0210RactSeq
    
    RETURN NUMBER;

/*******************************************************************************
 -- �����ֹ��Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0210POidSeq(v_Tord_No IN RTRE0210.TORD_NO%TYPE) /* ����ȣ */
    
    RETURN NUMBER;

/*******************************************************************************
 -- ���������ݰ��� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccImmWthdrMst(  v_Ract_Seq       IN  RTRE0210.RACT_SEQ%TYPE  /* ���¼����Ϸù�ȣ */
                                             , v_Tord_No        IN  RTRE0210.TORD_NO%TYPE   /* ����û������ȣ */
                                             , v_Cust_No        IN  RTRE0210.CUST_NO%TYPE   /* ����ȣ */
                                             , v_Recp_Amt       IN  RTRE0210.RECP_AMT%TYPE  /* �����ݾ� */
                                             , v_Recp_Tp        IN  RTRE0210.RECP_TP%TYPE   /* û������ */
                                             , v_Recp_Pay       IN  RTRE0210.RECP_PAY%TYPE  /* ������� */
                                             , v_Recp_Fg        IN  RTRE0210.RECP_FG%TYPE   /* �������� */
                                             , v_Tno            IN  RTRE0210.TNO%TYPE       /* �ŷ���ȣ */
                                             , v_Recv_Seq       IN  RTRE0210.RECV_SEQ%TYPE  /* ���¼����ŷ���ȣ */
                                             , v_Cnc_Stat       IN  RTRE0210.CNC_STAT%TYPE  /* ������ҿ��� */
                                             , v_P_Oid_Seq      IN  RTRE0210.P_OID_SEQ%TYPE /* �ֹ��Ϸù�ȣ */
                                             , v_Reg_Id         IN  RTRE0210.REG_ID%TYPE    /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- ���������ݰ��� �� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0211AccImmWthdrDtl(  v_Ract_Seq       IN  RTRE0211.RACT_SEQ%TYPE /* ���¼����Ϸù�ȣ */
                                             , v_Cust_No        IN  RTRE0211.CUST_NO%TYPE  /* ����ȣ */
                                             , v_Tord_No        IN  RTRE0211.TORD_NO%TYPE  /* ����û������ȣ */
                                             , v_Ord_No         IN  RTRE0211.ORD_NO%TYPE   /* ����ȣ */
                                             , v_Schd_Seq       IN  RTRE0211.SCHD_SEQ%TYPE /* û������ */
                                             , v_Recp_Tp        IN  RTRE0211.RECP_TP%TYPE  /* û������ */
                                             , v_Zfbdt          IN  RTRE0211.ZFBDT%TYPE    /* û������ */
                                             , v_Sale_Amt       IN  RTRE0211.SALE_AMT%TYPE /* û���ݾ� */
                                             , v_Arre_Amt       IN  RTRE0211.ARRE_AMT%TYPE /* �̳��ݾ� */
                                             , v_Reg_Id         IN  RTRE0211.REG_ID%TYPE   /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- ���������ݰ��� �������� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0212AccImmWthdrAcc(  v_Tno            IN  RTRE0212.TNO%TYPE        /* �ŷ���ȣ */
                                             , v_Sec_Bnk_No     IN  RTRE0212.BNK_NO%TYPE /* ���¹�ȣ */
                                             , v_Bnk_Cd         IN  RTRE0212.BNK_CD%TYPE     /* �����ڵ� */
                                             , v_Cust_Nm        IN  RTRE0212.CUST_NM%TYPE    /* �����ָ� */
                                             , v_Reg_Id         IN  RTRE0212.REG_ID%TYPE     /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*****************************************************************************
 -- ���������� ����ó�� ��� ����
 *****************************************************************************/
    FUNCTION f_UpdateRTRE0210RecvResult(  v_RACT_Day  IN  RTRE0210.RACT_DAY%TYPE /* ��û���� */
                                        , v_RACT_Seq  IN  RTRE0210.RACT_SEQ%TYPE /* ��û�Ϸù�ȣ */
                                        , v_Recv_Seq  IN  RTRE0210.RECV_SEQ%TYPE /* �����ŷ���ȣ */
                                        , v_Reg_Id    IN  RTRE0210.REG_ID%TYPE   /* ����� ID */
                                        , v_ErrorText OUT VARCHAR2
                                       )
    RETURN NUMBER;

/*****************************************************************************
 -- ���������� ����ó��
 *****************************************************************************/
    PROCEDURE p_CreateRTRE0210RactReceive(  v_Tno            IN  RTRE0210.TNO%TYPE    /* �ŷ�������ȣ */
                                          , v_Reg_Id         IN  RTRE0210.REG_ID%TYPE /* �����ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         );

/*******************************************************************************
  -- ���������ݰ����̷� �����Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0210HstReqSeq(  v_Ord_Cd  IN RTRE0215.ORD_CD%TYPE  /* ����ȣ */
                                  , v_Cust_No IN RTRE0215.CUST_NO%TYPE /* �ŷ���ȣ */
                                 )
    
    RETURN NUMBER;

/*****************************************************************************
 -- ���������� ������� ���� Update(ȯ���� �ƴ� ������Ҹ�)
 *****************************************************************************/
    FUNCTION f_UpdateRtre0210Cancle(  v_Recv_Seq  IN  RTRE0210.RECV_SEQ%TYPE /* �����ŷ���ȣ */
                                    , v_Cnc_Rseq  IN  RTRE0210.CNC_RSEQ%TYPE /* ������Ұŷ���ȣ */
                                    , v_Cnc_Stat  IN  RTRE0210.CNC_STAT%TYPE /* ������ҿ��� */
                                    , v_Reg_Id    IN  RTRE0210.REG_ID%TYPE   /* ����� ID */
                                    , v_ErrorText OUT VARCHAR2
                                   )
    RETURN NUMBER;

/*******************************************************************************
 -- ������������� ���� Update
 *******************************************************************************/
    PROCEDURE p_UpdateRtre0210AccCancel(  v_Ract_Day         IN  RTRE0210.RACT_DAY%TYPE         /* ī��������� */
                                        , v_Recv_Seq         IN  RTRE0210.RECV_SEQ%TYPE         /* �����ŷ���ȣ */
                                        , v_Cnc_Rseq         IN  RTRE0210.CNC_RSEQ%TYPE         /* ������Ұŷ���ȣ */
                                        , v_Cnc_Tno          IN  RTRE0210.CNC_TNO%TYPE          /* ��Ʋ��ũ��Ұŷ���ȣ */
                                        , v_Prt_Cnc_Rmnn_Amt IN  RTRE0210.PRT_CNC_RMNN_AMT%TYPE /* ��������ĳ����ݾ� */
                                        , v_Refund_Yn        IN  RTRE0210.REFUND_YN%TYPE        /* ȯ�ҿ��� */
                                        , v_Chg_Id           IN  RTRE0210.CHG_ID%TYPE           /* ������ ID */
                                        , v_Success_Code     OUT NUMBER
                                        , v_Return_Message   OUT VARCHAR2
                                        , v_Error_Text       OUT VARCHAR2
                                       );

/*******************************************************************************
 -- ���������ݰ����̷� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccImmWthdrHst(  v_Req_Seq	 	    IN  RTRE0215.REQ_SEQ%TYPE   /* ��û���� */
                                             , v_Cust_No        IN  RTRE0215.CUST_NO%TYPE   /* ����ȣ */
                                             , v_Ord_Cd         IN  RTRE0215.ORD_CD%TYPE    /* ����ȣ */
                                             , v_Work_Gb        IN  RTRE0215.WORK_GB%TYPE   /* ��û���� */
                                             , v_Method         IN  RTRE0215.METHOD%TYPE    /* �޼ҵ�� */
                                             , v_Pay_Gb         IN  RTRE0215.PAY_GB%TYPE    /* �������� */
                                             , v_P_Mid          IN  RTRE0215.P_MID%TYPE     /* �������̵� */
                                             , v_P_Oid          IN  RTRE0215.P_OID%TYPE     /* �ֹ���ȣ */
                                             , v_P_Tr_Dt        IN  RTRE0215.P_TR_DT%TYPE   /* �ŷ����� */
                                             , v_P_Tr_Time      IN  RTRE0215.P_TR_TIME%TYPE /* �ŷ��ð� */
                                             , v_P_Acc_No       IN  RTRE0215.P_ACC_NO%TYPE  /* ���¹�ȣ */
                                             , v_P_Bank_Cd      IN  RTRE0215.P_BANK_CD%TYPE /* �����ڵ� */
                                             , v_P_Cust_Id      IN  RTRE0215.P_CUST_ID%TYPE /* ��ID */
                                             , v_P_Cust_Nm      IN  RTRE0215.P_CUST_NM%TYPE /* �����ָ� */
                                             , v_P_Uname        IN  RTRE0215.P_UNAME%TYPE   /* ���������� */
                                             , v_P_Goods        IN  RTRE0215.P_GOODS%TYPE   /* ������ǰ�� */
                                             , v_P_Amt          IN  RTRE0215.P_AMT%TYPE     /* �ŷ��ݾ� */
                                             , v_P_Rm           IN  RTRE0215.P_RM%TYPE      /* ������� */
                                             , v_P_Bname        IN  RTRE0215.P_BNAME%TYPE   /* �������ڸ� */
                                             , v_P_Hash         IN  RTRE0215.P_HASH%TYPE    /* Hash������ */
                                             , v_P_Tr_No        IN  RTRE0215.P_TR_NO%TYPE   /* �ŷ���ȣ */
                                             , v_P_Satus        IN  RTRE0215.P_SATUS%TYPE   /* �ŷ����� */
                                             , v_P_Err_Cd       IN  RTRE0215.P_ERR_CD%TYPE  /* �����ڵ� */
                                             , v_PRmesg         IN  RTRE0215.P_RMESG%TYPE   /* �޽��� */
                                             , v_Reg_Id         IN  RTRE0215.REG_ID%TYPE     /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
  -- �ŷ���ҹ�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0210HstCncSeq(v_Tno IN RTRE0216.TNO%TYPE) /* �ŷ���ȣ */

    RETURN NUMBER;

/*******************************************************************************
  -- ��������������̷� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccCancelHst(  v_Tno            IN  RTRE0216.TNO%TYPE      /* �ŷ���ȣ */
                                           , v_Cnc_Seq        IN  RTRE0216.CNC_SEQ%TYPE  /* �ŷ���ҹ�ȣ */
                                           , v_Mod_Type       IN  RTRE0216.MOD_TYPE%TYPE /* ��û���� */
                                           , v_Mod_Mny        IN  RTRE0216.MOD_MNY%TYPE  /* ��ҿ�û�ݾ� */
                                           , v_Rem_Mny        IN  RTRE0216.REM_MNY%TYPE  /* ��Ұ��ɱݾ� */
                                           , v_Mod_Desc       IN  RTRE0216.MOD_DESC%TYPE /* ��һ��� */
                                           , v_Res_Cd         IN  RTRE0216.RES_CD%TYPE   /* ����ڵ� */
                                           , v_Res_Msg        IN  RTRE0216.RES_MSG%TYPE  /* ������� */
                                           , v_Reg_Id         IN  RTRE0216.REG_ID%TYPE   /* ����� ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          );
END Pkg_Rtre0210;
/
