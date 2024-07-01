CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0220 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0220
   PURPOSE : ������� ��Ȳ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-02  ncho             1. Created this package spec.
   1.2        2019-06-04  wjim            [20190604_01] �Ա����� �߰�
*******************************************************************************/
    /*****************************************************************************
     -- ������� �ŷ����� ���� Select
     *****************************************************************************/
    PROCEDURE p_sRtre0220_vaccTransTotal(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Recv_Ym  IN VARCHAR                /* ������� */
                                         , v_Bank_Cd  IN VACS_TOTL.BANK_CD%TYPE /* �����ڵ� */
                                        );
    /*****************************************************************************
     -- ������� �߱޳��� ��ȸ(���θ���)
     *****************************************************************************/
    PROCEDURE p_sRtre0220_custVaccInfo(  Ref_Cursor IN OUT SYS_REFCURSOR
                                       , v_safe_key  IN RTSD0100.SAFEKEY%TYPE  /*������Ű*/
                                        );    /*****************************************************************************

    /*****************************************************************************
     -- ������� ��Ȳ��ȸ Select
     *****************************************************************************/
    PROCEDURE p_sRtre0220_vaccMang(  Ref_Cursor IN OUT SYS_REFCURSOR
                                   , v_Bank_Cd  IN VACS_VACT.BANK_CD%TYPE /* �����ڵ� */
                                  );

    /*****************************************************************************
     -- �Ⱓ�����������
     *****************************************************************************/
    PROCEDURE p_Rtre0220_prdExprArngm(  v_Bank_Cd_Param  IN  VACS_VACT.BANK_CD%TYPE /* �����ڵ� */
                                      , v_Success_Code   OUT NUMBER
                                      , v_Return_Message OUT VARCHAR2
                                      , v_ErrorText      OUT VARCHAR2
                                     );

    /*****************************************************************************
     -- ������� ���� Update
     *****************************************************************************/
    FUNCTION f_UpdateRtre0220_prdExprArngm(  v_Bank_Cd    IN  VACS_VACT.BANK_CD%TYPE    /* �����ڵ� */
                                           , v_Acct_No    IN  VACS_VACT.ACCT_NO%TYPE    /* ���¹�ȣ */
                                           , v_Cmf_Nm     IN  VACS_VACT.CMF_NM%TYPE     /* ������ */
                                           , v_Acct_St    IN  VACS_VACT.ACCT_ST%TYPE    /* ���»��� */
                                           , v_Open_Il    IN  VACS_VACT.OPEN_IL%TYPE    /* �Ҵ����� */
                                           , v_Fst_Il     IN  VACS_VACT.FST_IL%TYPE     /* ���ʰŷ����� */
                                           , v_Lst_Il     IN  VACS_VACT.LST_IL%TYPE     /* �����ŷ����� */
                                           , v_Tr_Amt     IN  VACS_VACT.TR_AMT%TYPE     /* �Ѱŷ��ݾ� */
                                           , v_Tramt_Cond IN  VACS_VACT.TRAMT_COND%TYPE /* �ŷ��ݾ����� */
                                           , v_Trmc_Cond  IN  VACS_VACT.TRMC_COND%TYPE  /* ����ȸ������ */
                                           , v_Trbegin_Il IN  VACS_VACT.TRBEGIN_IL%TYPE /* �Աݰ��ɽ����� */
                                           , v_Trend_Il   IN  VACS_VACT.TREND_IL%TYPE   /* �Աݰ��ɸ����� */
                                           , v_Trbegin_Si IN  VACS_VACT.TRBEGIN_SI%TYPE /* �Աݰ��ɽ��۽ð� */
                                           , v_Trend_Si   IN  VACS_VACT.TREND_SI%TYPE   /* �Աݰ��ɸ���ð� */
                                           , v_Seq_No     IN  VACS_VACT.SEQ_NO%TYPE     /* �Ⱓ������Ƚ�� */
                                           , v_ErrorText  OUT VARCHAR2
                                          )
    RETURN NUMBER;

/*******************************************************************************
 -- ��û�Ϸù�ȣ ä��
 *******************************************************************************/
    FUNCTION f_sRtre0220RvaSeq
    RETURN NUMBER;

/*******************************************************************************
 -- ������¹�ȣ ����
 *******************************************************************************/
    FUNCTION f_sRtre0220AcctNo(v_Bank_Cd IN RTRE0220.BANK_CD%TYPE)
    RETURN VARCHAR;

/*******************************************************************************
 -- �������(VAN) �߱� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0220VaccIssuedMst(  v_Rva_Seq          IN  RTRE0220.RVA_SEQ%TYPE          /* ��û�Ϸù�ȣ */
                                            , v_Cust_No          IN  RTRE0220.CUST_NO%TYPE          /* ����ȣ */
                                            , v_Cust_Nm          IN  RTRE0220.CUST_NM%TYPE          /* ���� */
                                            , v_Tord_No          IN  RTRE0220.TORD_NO%TYPE          /* ����û������ȣ */
                                            , v_Rva_Amt          IN  RTRE0220.RVA_AMT%TYPE          /* ��û�ݾ� */
                                            , v_Bank_Cd          IN  RTRE0220.BANK_CD%TYPE          /* �����ڵ� */
                                            , v_Acct_No          IN  RTRE0220.VACCOUNT%TYPE         /* ������¹�ȣ */
                                            , v_Expiry_Acc       IN  RTRE0220.RVA_DAY%TYPE          /* ���������� */
                                            , v_Dps_Nm           IN  RTRE0220.DPS_NM%TYPE           /* �Ա��ڸ� */
                                            , v_Sms_Send_Trgt_No IN  RTRE0220.SMS_SEND_TRGT_NO%TYPE /* �Ա��ڸ� */
                                            , v_Reg_Id           IN  RTRE0220.REG_ID%TYPE           /* ����� ID */
                                            , v_Success_Code     OUT NUMBER
                                            , v_Return_Message   OUT VARCHAR2
                                            , v_Error_Text       OUT VARCHAR2
                                           );

/*******************************************************************************
 -- �������(VAN) �� �߱� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0221VaccIssuedDtl(  v_Rva_Seq        IN  RTRE0221.RVA_SEQ%TYPE  /* ��û�Ϸù�ȣ */
                                            , v_Cust_No        IN  RTRE0221.CUST_NO%TYPE  /* ����ȣ */
                                            , v_Tord_No        IN  RTRE0221.TORD_NO%TYPE  /* ����û������ȣ */
                                            , v_Ord_No         IN  RTRE0221.ORD_NO%TYPE   /* ����ȣ */
                                            , v_Schd_Seq       IN  RTRE0221.SCHD_SEQ%TYPE /* û������ */
                                            , v_Recp_Tp        IN  RTRE0221.RECP_TP%TYPE  /* û������ */
                                            , v_Demd_Dt        IN  RTRE0221.DEMD_DT%TYPE  /* û������ */
                                            , v_Zfbdt          IN  RTRE0221.ZFBDT%TYPE    /* ����������� */
                                            , v_Sale_Amt       IN  RTRE0221.SALE_AMT%TYPE /* û���ݾ� */
                                            , v_Arre_Amt       IN  RTRE0221.ARRE_AMT%TYPE /* ��ü�ݾ� */
                                            , v_Reg_Id         IN  RTRE0221.REG_ID%TYPE   /* ����� ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_Error_Text     OUT VARCHAR2
                                           );

/*******************************************************************************
 -- ������¿��� Update
 *******************************************************************************/
    PROCEDURE p_UpdateVacsVactVaccIssued(  v_Bank_Cd        IN  VACS_VACT.BANK_CD%TYPE  /* �����ڵ� */
                                         , v_Acct_No        IN  VACS_VACT.ACCT_NO%TYPE  /* ������¹�ȣ */
                                         , v_Cmf_Nm         IN  VACS_VACT.CMF_NM%TYPE   /* �Ա��ڸ� */
                                         , v_Tr_Amt         IN  VACS_VACT.TR_AMT%TYPE   /* �Ѱŷ��ݾ� */
                                         , v_Trend_Il       IN  VACS_VACT.TREND_IL%TYPE /* �Աݰ��ɸ����� */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_Error_Text     OUT VARCHAR2
                                        );

 /*****************************************************************************
  -- �������(VAN) �Ա� ����ó�� ��� ����
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-06-04  wjim            [20190604_01] �Ա����� �߰�
  *****************************************************************************/
  FUNCTION f_UpdateRtre0220RecvResult (
      v_Rva_Day        IN RTRE0220.RVA_DAY%TYPE        /*��û����             */
    , v_Rva_Seq        IN RTRE0220.RVA_SEQ%TYPE        /*��û�Ϸù�ȣ         */
    , v_Rqst_Stat      IN RTRE0220.RQST_STAT%TYPE      /*����                 */
    , v_Tr_Day         IN RTRE0220.TR_DAY%TYPE         /*�Ա�����             */ --[20190604_01]
    , v_Tno            IN RTRE0220.TNO%TYPE            /*�ŷ�������ȣ         */
    , v_Recv_Seq       IN RTRE0220.RECV_SEQ%TYPE       /*�����ŷ���ȣ         */
    , v_Dps_Nm         IN RTRE0220.DPS_NM%TYPE         /*�Ա��ڸ�             */
    , v_Reg_Id         IN RTRE0220.REG_ID%TYPE         /*����� ID            */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;


 /*****************************************************************************
  -- �������(VAN) ����ó��
  *****************************************************************************/
   PROCEDURE p_CreateRtre0220VaReceive (
      v_Tno               IN RTRE0220.TNO%TYPE        /* �ŷ�������ȣ      */
    , v_Work_Spcope       IN RTRE0220.WORK_SCOPE%TYPE /* ��������          */
    , v_Vaccount          IN RTRE0220.VACCOUNT%TYPE   /* ������¹�ȣ      */
    , v_Cust_No           IN RTRE0220.CUST_NO%TYPE    /* ����ȣ          */
    , v_Tord_No           IN RTRE0220.TORD_NO%TYPE    /* ��ǥ����ȣ      */
    , v_Tr_Il             IN VACS_AHST.TR_IL%TYPE     /* �뺸����          */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );

 /*****************************************************************************
  -- �������(VAN) �Աݴ�� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220RecvResult (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) ;

 /*****************************************************************************
  -- �������(VAN) �Ա���� ó�� (��Ʋ��ũ���� ��û�� �Ա���ҿ�û
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220RecvCnclResult (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) ;
  
 /*****************************************************************************
  -- �������(VAN) �Ա� ���ó�� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0220RecvCncl (
      v_Rva_Day        IN RTRE0220.RVA_DAY%TYPE       /*��û����              */
    , v_Rva_Seq        IN RTRE0220.RVA_SEQ%TYPE       /*��û�Ϸù�ȣ          */
    , v_Cnc_Rseq       IN RTRE0220.CNC_RSEQ%TYPE      /*��û�Ϸù�ȣ          */
    , v_Cnc_Stat      IN RTRE0220.RQST_STAT%TYPE            /*�����ŷ���ȣ          */
    , v_Reg_Id         IN RTRE0220.REG_ID%TYPE         /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;  

 /*****************************************************************************
  -- 3��ü�̻� �� ������� �߱� �� SMS�߼�
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220LtCstVrtAcnIs (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
/*******************************************************************************
 -- �������(VAN) �߱� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0220VaccMstTmp(  v_Rva_Seq          IN  RTRE0220.RVA_SEQ%TYPE          /* ��û�Ϸù�ȣ */
                                            , v_Cust_No          IN  RTRE0220.CUST_NO%TYPE          /* ����ȣ */
                                            , v_Cust_Nm          IN  RTRE0220.CUST_NM%TYPE          /* ���� */
                                            , v_Tord_No          IN  RTRE0220.TORD_NO%TYPE          /* ����û������ȣ */
                                            , v_Rva_Amt          IN  RTRE0220.RVA_AMT%TYPE          /* ��û�ݾ� */
                                            , v_Bank_Cd          IN  RTRE0220.BANK_CD%TYPE          /* �����ڵ� */
                                            , v_Acct_No          IN  RTRE0220.VACCOUNT%TYPE         /* ������¹�ȣ */
                                            , v_Expiry_Acc       IN  RTRE0220.RVA_DAY%TYPE          /* ���������� */
                                            , v_Dps_Nm           IN  RTRE0220.DPS_NM%TYPE           /* �Ա��ڸ� */
                                            , v_Sms_Send_Trgt_No IN  RTRE0220.SMS_SEND_TRGT_NO%TYPE /* �Ա��ڸ� */
                                            , v_Reg_Id           IN  RTRE0220.REG_ID%TYPE           /* ����� ID */
                                            , v_Success_Code     OUT NUMBER
                                            , v_Return_Message   OUT VARCHAR2
                                            , v_Error_Text       OUT VARCHAR2
                                           );

/*******************************************************************************
 -- �������(VAN) �� �߱� Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0221VaccDtlTmp(  v_Rva_Seq        IN  RTRE0221.RVA_SEQ%TYPE  /* ��û�Ϸù�ȣ */
                                            , v_Cust_No        IN  RTRE0221.CUST_NO%TYPE  /* ����ȣ */
                                            , v_Tord_No        IN  RTRE0221.TORD_NO%TYPE  /* ����û������ȣ */
                                            , v_Ord_No         IN  RTRE0221.ORD_NO%TYPE   /* ����ȣ */
                                            , v_Schd_Seq       IN  RTRE0221.SCHD_SEQ%TYPE /* û������ */
                                            , v_Recp_Tp        IN  RTRE0221.RECP_TP%TYPE  /* û������ */
                                            , v_Demd_Dt        IN  RTRE0221.DEMD_DT%TYPE  /* û������ */
                                            , v_Zfbdt          IN  RTRE0221.ZFBDT%TYPE    /* ����������� */
                                            , v_Sale_Amt       IN  RTRE0221.SALE_AMT%TYPE /* û���ݾ� */
                                            , v_Arre_Amt       IN  RTRE0221.ARRE_AMT%TYPE /* ��ü�ݾ� */
                                            , v_Reg_Id         IN  RTRE0221.REG_ID%TYPE   /* ����� ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_Error_Text     OUT VARCHAR2
                                           );

END Pkg_Rtre0220;
/
