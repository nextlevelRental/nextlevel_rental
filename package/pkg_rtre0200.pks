CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0200 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0200
   PURPOSE : ī�������� ������ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-06  ncho             1. Created this package spec.
 *******************************************************************************/

/*******************************************************************************
 -- ī�������� ������ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0200_crdImmWthdrList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                          , v_Rcrd_F_Day IN RTRE0200.RCRD_DAY%TYPE /* �������� StartDay */
                                          , v_Rcrd_T_Day IN RTRE0200.RCRD_DAY%TYPE /* �������� EndDay */
                                          , v_Ord_No     IN RTRE0200.TORD_NO%TYPE  /* ����û������ȣ */
                                          , v_Cust_No    IN RTRE0200.CUST_NO%TYPE  /* ����ȣ */
                                         );

/*******************************************************************************
 -- �������� ����ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0200_crdImmWthdrDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                             , v_Recv_Seq IN RTRE0030.RECV_SEQ%TYPE /* �����ŷ���ȣ */
                                            );

/*******************************************************************************
 -- ī������Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0200RcrdSeq

    RETURN NUMBER;

/*******************************************************************************
 -- ī�������ݰ��� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdImmWthdrMst(  v_Rcrd_Seq       IN  RTRE0200.RCRD_SEQ%TYPE /* ī������Ϸù�ȣ */
                                             , v_Tord_No        IN  RTRE0200.TORD_NO%TYPE  /* ����û������ȣ */
                                             , v_Cust_No        IN  RTRE0200.CUST_NO%TYPE  /* ����ȣ */
                                             , v_Recp_Amt       IN  RTRE0200.RECP_AMT%TYPE /* �����ݾ� */
                                             , v_Recp_Tp        IN  RTRE0200.RECP_TP%TYPE  /* û������ */
                                             , v_Recp_Pay       IN  RTRE0200.RECP_PAY%TYPE /* ������� */
                                             , v_Recp_Fg        IN  RTRE0200.RECP_FG%TYPE  /* �������� */
                                             , v_Tno            IN  RTRE0200.TNO%TYPE      /* �ŷ���ȣ */
                                             , v_App_No         IN  RTRE0200.APP_NO%TYPE   /* ���ι�ȣ */
                                             , v_Recv_Seq       IN  RTRE0200.RECV_SEQ%TYPE /* ī������ŷ���ȣ */
                                             , v_Cnc_Stat       IN  RTRE0200.CNC_STAT%TYPE /* ������ҿ��� */
                                             , v_Reg_Id         IN  RTRE0200.REG_ID%TYPE   /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- ī�������ݰ��� �� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0201CrdImmWthdrDtl(  v_Rcrd_Seq       IN  RTRE0201.RCRD_SEQ%TYPE /* ī������Ϸù�ȣ */
                                             , v_Cust_No        IN  RTRE0201.CUST_NO%TYPE  /* ����ȣ */
                                             , v_Tord_No        IN  RTRE0201.TORD_NO%TYPE  /* ����û������ȣ */
                                             , v_Ord_No         IN  RTRE0201.ORD_NO%TYPE   /* ����ȣ */
                                             , v_Schd_Seq       IN  RTRE0201.SCHD_SEQ%TYPE /* û������ */
                                             , v_Recp_Tp        IN  RTRE0201.RECP_TP%TYPE  /* û������ */
                                             , v_Zfbdt          IN  RTRE0201.ZFBDT%TYPE    /* û������ */
                                             , v_Sale_Amt       IN  RTRE0201.SALE_AMT%TYPE /* û���ݾ� */
                                             , v_Arre_Amt       IN  RTRE0201.ARRE_AMT%TYPE /* �̳��ݾ� */
                                             , v_Reg_Id         IN  RTRE0201.REG_ID%TYPE   /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- ī�������ݰ��� ī������ Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0202CrdImmWthdrCrd(  v_Tno            IN  RTRE0202.TNO%TYPE        /* �ŷ���ȣ */
                                             , v_Sec_Crd_No     IN  RTRE0202.CRD_NO%TYPE /* ī���ȣ */
                                             , v_Crd_Cd         IN  RTRE0202.CRD_CD%TYPE     /* ī����ڵ� */
                                             , v_Reg_Id         IN  RTRE0202.REG_ID%TYPE     /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*****************************************************************************
 -- ī����� �Ա� ����ó�� ��� ����
 *****************************************************************************/
    FUNCTION f_UpdateRtre0200RecvResult(  v_Rcrd_Day  IN  RTRE0200.RCRD_DAY%TYPE /* ��û���� */
                                        , v_Rcrd_Seq  IN  RTRE0200.RCRD_SEQ%TYPE /* ��û�Ϸù�ȣ */
                                        , v_Recv_Seq  IN  RTRE0200.RECV_SEQ%TYPE /* �����ŷ���ȣ */
                                        , v_Reg_Id    IN  RTRE0200.REG_ID%TYPE   /* ����� ID */
                                        , v_ErrorText OUT VARCHAR2
                                       )
    RETURN NUMBER;

/*****************************************************************************
 -- ī����� ����ó��
 *****************************************************************************/
    PROCEDURE p_CreateRtre0200RcrdReceive(  v_Tno            IN  RTRE0200.TNO%TYPE    /* �ŷ�������ȣ */
                                          , v_Reg_Id         IN  RTRE0200.REG_ID%TYPE /* �����ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         );

/*******************************************************************************
  -- ī�������ݰ����̷� �����Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0200HstRcrdSeq

    RETURN NUMBER;

/*******************************************************************************
  -- ī�������ݰ����̷� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdImmWthdrHst(  v_Rcrd_Seq       IN  RTRE0205.RCRD_SEQ%TYPE   /* �����Ϸù�ȣ */
                                             , v_Tord_No        IN  RTRE0205.TORD_NO%TYPE    /* ����û������ȣ */
                                             , v_Cust_No        IN  RTRE0205.CUST_NO%TYPE    /* ����ȣ */
                                             , v_Recp_Amt       IN  RTRE0205.RECP_AMT%TYPE   /* �����ݾ� */
                                             , v_Email          IN  RTRE0205.EMAIL%TYPE      /* �ֹ��� E-Mail */
                                             , v_Tno            IN  RTRE0205.TNO%TYPE        /* �ŷ���ȣ */
                                             , v_Sec_Crd_No     IN  RTRE0205.CRD_NO%TYPE /* ī���ȣ */
                                             , v_Crd_Cd         IN  RTRE0205.CRD_CD%TYPE     /* ī����ڵ� */
                                             , v_Crd_Nm         IN  RTRE0205.CRD_NM%TYPE     /* ī���� */
                                             , v_App_Time       IN  RTRE0205.APP_TIME%TYPE   /* �������νð� */
                                             , v_App_No         IN  RTRE0205.APP_NO%TYPE     /* ���ι�ȣ */
                                             , v_Noinf          IN  RTRE0205.NOINF%TYPE      /* �������Һο��� */
                                             , v_Noinf_Type     IN  RTRE0205.NOINF_TYPE%TYPE /* �������Һ� �̺�Ʈ ���� */
                                             , v_Quota          IN  RTRE0205.QUOTA%TYPE      /* �Һΰ��� */
                                             , v_Res_Cd         IN  RTRE0205.RES_CD%TYPE     /* ����ڵ� */
                                             , v_Res_Msg        IN  RTRE0205.RES_MSG%TYPE    /* ������� */
                                             , v_Reg_Id         IN  RTRE0205.REG_ID%TYPE     /* ����� ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*****************************************************************************
 -- ī�������� ������� ���� Update(ȯ���� �ƴ� ������Ҹ�)
 *****************************************************************************/
    FUNCTION f_UpdateRtre0200Cancle(  v_Recv_Seq  IN  RTRE0200.RECV_SEQ%TYPE /* �����ŷ���ȣ */
                                    , v_Cnc_Rseq  IN  RTRE0200.CNC_RSEQ%TYPE /* ������Ұŷ���ȣ */
                                    , v_Cnc_Stat  IN  RTRE0200.CNC_STAT%TYPE /* ������ҿ��� */
                                    , v_Reg_Id    IN  RTRE0200.REG_ID%TYPE   /* ����� ID */
                                    , v_ErrorText OUT VARCHAR2
                                   )
    RETURN NUMBER;

/*******************************************************************************
 -- ī����������� ���� Update
 *******************************************************************************/
    PROCEDURE p_UpdateRtre0200CrdCancel(  v_Rcrd_Day         IN  RTRE0200.RCRD_DAY%TYPE         /* ī��������� */
                                        , v_Recv_Seq         IN  RTRE0200.RECV_SEQ%TYPE         /* �����ŷ���ȣ */
                                        , v_Cnc_Rseq         IN  RTRE0200.CNC_RSEQ%TYPE         /* ������Ұŷ���ȣ */
                                        , v_Cnc_Tno          IN  RTRE0200.CNC_TNO%TYPE          /* KCP��Ұŷ���ȣ */
                                        , v_Prt_Cnc_Rmnn_Amt IN  RTRE0200.PRT_CNC_RMNN_AMT%TYPE /* ��������ĳ����ݾ� */
                                        , v_Refund_Yn        IN  RTRE0200.REFUND_YN%TYPE        /* ȯ�ҿ��� */
                                        , v_Chg_Id           IN  RTRE0200.CHG_ID%TYPE           /* ����� ID */
                                        , v_Success_Code     OUT NUMBER
                                        , v_Return_Message   OUT VARCHAR2
                                        , v_Error_Text       OUT VARCHAR2
                                       );

/*******************************************************************************
  -- ī������������̷� �ŷ���ҹ�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0200HstCncSeq(v_Tno IN RTRE0206.TNO%TYPE) /* �ŷ���ȣ */

    RETURN NUMBER;

/*******************************************************************************
  -- ī������������̷� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdCancelHst(  v_Tno            IN  RTRE0206.TNO%TYPE      /* �ŷ���ȣ */
                                           , v_Cnc_Seq        IN  RTRE0206.CNC_SEQ%TYPE  /* �ŷ���ҹ�ȣ */
                                           , v_Mod_Type       IN  RTRE0206.MOD_TYPE%TYPE /* ��û���� */
                                           , v_Mod_Mny        IN  RTRE0206.MOD_MNY%TYPE  /* ��ҿ�û�ݾ� */
                                           , v_Rem_Mny        IN  RTRE0206.REM_MNY%TYPE  /* ��Ұ��ɱݾ� */
                                           , v_Mod_Desc       IN  RTRE0206.MOD_DESC%TYPE /* ��һ��� */
                                           , v_Res_Cd         IN  RTRE0206.RES_CD%TYPE   /* ����ڵ� */
                                           , v_Res_Msg        IN  RTRE0206.RES_MSG%TYPE  /* ������� */
                                           , v_Reg_Id         IN  RTRE0206.REG_ID%TYPE   /* ����� ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          );
                                          
/*****************************************************************************
 -- ī�������� ����ó�� �޴���
 --
 *****************************************************************************/
    PROCEDURE p_InsertRtre0200TotCrdRecvMng(  v_Recv_Day       IN  VARCHAR2     /*��������  */
                                            , v_Ord_No         IN  VARCHAR2       /* ����ȣ */
                                            , v_Cust_No        IN  VARCHAR2      /* ����ȣ */
                                            , v_Recp_Amt       IN  VARCHAR2     /* �����ݾ� */
                                            , v_Tno            IN  VARCHAR2          /* �ŷ�������ȣ */
                                            , v_App_No         IN  VARCHAR2       /* ���ι�ȣ */
                                            , v_Dc_Cd          IN  VARCHAR2        /* �����ڵ� */
                                            , v_Prpt_Mon       IN  VARCHAR2      /* �������� */
                                            , v_Cnc_Day        IN  VARCHAR2      /* ������� */
                                            , v_Serv_Amt       IN  VARCHAR2     /* �߰����αݾ� */
                                            , v_Mfp_Cd         IN  VARCHAR2       /* �������� */
                                            , v_Mfp_Rsn_Cd     IN  VARCHAR2        /* �ϳ����������ڵ� */
                                            , v_Mfp_Desc       IN  VARCHAR2          /* �ϳ������󼼻��� */
                                            , v_Work_Cd        IN  VARCHAR2                   /* �������� ���� */
                                            , v_Reg_Id         IN  VARCHAR2 /* ����� ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_ErrorText      OUT VARCHAR2
                                             );
                                             
/*****************************************************************************
 -- ī�������� ȯ��ó�� �޴���
 --
 *****************************************************************************/
    PROCEDURE p_Rtre0200TotCrdRecvRfndMng(  v_Recv_Day       IN  VARCHAR2      /*��������  */
                                          , v_Ord_No         IN  VARCHAR2       /* ����ȣ */
                                          , v_Cust_No        IN  VARCHAR2      /* ����ȣ */
                                          , v_Panc_Remn_Amt  IN  VARCHAR2      /* ȯ���ĳ����ݾ� */
                                          , v_Recv_Seq       IN  VARCHAR2     /* �����ŷ���ȣ */
                                          , v_Prpt_Seq       IN  VARCHAR2       /* �������� */
                                          , v_Work_Cd        IN  VARCHAR2
                                          , v_Tno            IN  VARCHAR2    /* �ŷ�������ȣ */
                                          , v_Reg_Id         IN  VARCHAR2 /* ����� ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         );                                             

/*******************************************************************************
  -- ī�������ݰ����̷� Insert (���� - �׻�)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0205CrdHst(  v_Tord_No        IN  VARCHAR2    /* ����û������ȣ */
                                     , v_Cust_No        IN  VARCHAR2    /* ����ȣ */
                                     , v_Recp_Amt       IN  VARCHAR2   /* �����ݾ� */
                                     , v_Email          IN  VARCHAR2      /* �ֹ��� E-Mail */
                                     , v_Tno            IN  VARCHAR2        /* �ŷ���ȣ */
                                     , v_Sec_Crd_No     IN  VARCHAR2 /* ī���ȣ */
                                     , v_Crd_Cd         IN  VARCHAR2     /* ī����ڵ� */
                                     , v_Crd_Nm         IN  VARCHAR2     /* ī���� */
                                     , v_App_Time       IN  VARCHAR2   /* �������νð� */
                                     , v_App_No         IN  VARCHAR2    /* ���ι�ȣ */
                                     , v_Noinf          IN  VARCHAR2     /* �������Һο��� */
                                     , v_Noinf_Type     IN  VARCHAR2 /* �������Һ� �̺�Ʈ ���� */
                                     , v_Quota          IN  VARCHAR2      /* �Һΰ��� */
                                     , v_Res_Cd         IN  VARCHAR2     /* ����ڵ� */
                                     , v_Res_Msg        IN  VARCHAR2    /* ������� */
                                     , v_Reg_Id         IN  VARCHAR2     /* ����� ID */
                                     , v_Success_Code   OUT NUMBER
                                     , v_Return_Message OUT VARCHAR2
                                     , v_Error_Text     OUT VARCHAR2
                                    );
                                    
/*******************************************************************************
  -- ī������������̷� Insert (ȯ�� - �׻�)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0206CrdHst(  v_Tno            IN  VARCHAR2      /* �ŷ���ȣ */
                                       , v_Mod_Type       IN  VARCHAR2 /* ��û���� */
                                       , v_Mod_Mny        IN  VARCHAR2  /* ��ҿ�û�ݾ� */
                                       , v_Rem_Mny        IN  VARCHAR2  /* ��Ұ��ɱݾ� */
                                       , v_Mod_Desc       IN  VARCHAR2 /* ��һ��� */
                                       , v_Res_Cd         IN  VARCHAR2   /* ����ڵ� */
                                       , v_Res_Msg        IN  VARCHAR2  /* ������� */
                                       , v_Reg_Id         IN  VARCHAR2   /* ����� ID */
                                       , v_Success_Code   OUT NUMBER
                                       , v_Return_Message OUT VARCHAR2
                                       , v_Error_Text     OUT VARCHAR2
                                      );
                                      
/*******************************************************************************
 -- ī�������ݰ��� ī������ Insert (���� - ����)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0202CrdHst(  v_Tno            IN  VARCHAR2        /* �ŷ���ȣ */
                                     , v_Sec_Crd_No     IN  VARCHAR2 /* ī���ȣ */
                                     , v_Crd_Cd         IN  VARCHAR2     /* ī����ڵ� */
                                     , v_Reg_Id         IN  VARCHAR2     /* ����� ID */
                                     , v_Success_Code   OUT NUMBER
                                     , v_Return_Message OUT VARCHAR2
                                     , v_Error_Text     OUT VARCHAR2
                                    );
                                                                              
END Pkg_Rtre0200;
/
