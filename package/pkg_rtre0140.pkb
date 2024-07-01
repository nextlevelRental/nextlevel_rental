CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0140 AS
/*******************************************************************************
    NAME        PKG_RTRE0140
    PURPOSE     ������� ���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] �ű� ����
    1.1     2017-10-27  wjim            [20170227_01] ������� �߱� SMS �߼� �߰�
    1.2     2017-11-15  wjim            [20171115_01] ������³�����ȸ ��ȸ���� �߰�
                                        - ��û�ڱ׷�
    1.3     2018-01-05  wjim            [20180104_01] ������� ��ü��ȸ ��� �߰�
    1.4     2018-11-28  ncho            ��Ʋ��ũ ������ ������� �߰�
    1.5     2019-06-04  wjim            [20190604_01] �Ա����� �߰�
*******************************************************************************/

/*****************************************************************************
 -- ������� ���� Select

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.2     2017-11-15  wjim            [20171115_01] ��û�ڱ׷� ��ȸ���� �߰�
    1.4     2018-11-28  ncho            ��Ʋ��ũ ������ ������� �߰�
    1.5     2019-06-04  wjim            [20190604_01] �Ա����� �߰�
 *****************************************************************************/
    PROCEDURE p_sRtre0140(  Ref_Cursor      IN OUT SYS_REFCURSOR
                          , v_Cust_No       IN RTRE0140.CUST_NO%TYPE    /* ����ȣ */
                          , v_Ord_No        IN RTRE0141.ORD_NO%TYPE     /* ����ȣ */
                          , v_Rva_Fday      IN RTRE0140.RVA_DAY%TYPE    /* ��û����(from) */
                          , v_Rva_Tday      IN RTRE0140.RVA_DAY%TYPE    /* ��û����(to) */
                          , v_Rqst_Stat     IN RTRE0140.RQST_STAT%TYPE  /* ���� */
                          , v_Tno           IN RTRE0140.TNO%TYPE        /* �ŷ�������ȣ */
                          , v_Vaccount      IN RTRE0140.VACCOUNT%TYPE   /* ������¹�ȣ */
                          , v_Va_Fday       IN RTRE0140.VA_DATE%TYPE    /* ������� �Աݸ�����(from) */
                          , v_Va_Tday       IN RTRE0140.VA_DATE%TYPE    /* ������� �Աݸ�����(to) */
                          , v_App_Fday      IN RTRE0140.APP_TIME%TYPE   /* ������� �߱���(from) */
                          , v_App_Tday      IN RTRE0140.APP_TIME%TYPE   /* ������� �߱���(to) */
                          , v_App_Reg_Id    IN RTRE0140.APP_REG_ID%TYPE /* ������� �߱���ID */
                          , v_Reg_Id        IN RTRE0140.REG_ID%TYPE     /* �߱޿�û �����ID */
                          , v_Ipgm_Fday     IN RTRE0142.IPGM_TIME%TYPE  /* �Ա���(from) */
                          , v_Ipgm_Tday     IN RTRE0142.IPGM_TIME%TYPE  /* �Ա���(to) */
                          , v_Noti_Id       IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID */
                          , v_Remitter      IN RTRE0142.REMITTER%TYPE   /* �Ա��ڸ� */
                          , v_User_Grp      IN RTCM0001.USER_GRP%TYPE   /* ��û�ڱ׷� */
                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.CHK          /* Check */
                  , A.RVA_DAY      /* ��û���� */
                  , A.RVA_SEQ      /* ��û�Ϸù�ȣ */
                  , A.CUST_NO      /* ����ȣ */
                  , A.CUST_NM      /* ���� */
                  , A.TORD_NO      /* ����û������ȣ */
                  , A.RECP_PAY     /* ��������ڵ� */
                  , A.RECP_PAY_NM  /* ��������� */
                  , A.WORK_SCOPE   /* �������� */
                  , A.RVA_AMT      /* ��û�ݾ� */
                  , A.RQST_STAT    /* ���� */
                  , A.RQST_STAT_NM /* ���¸� */
                  , A.REG_DT       /* ����� */
                  , A.REG_ID       /* ����� ID */
                  , A.RES_CD       /* ��û����ڵ� */
                  , A.RES_MSG      /* ��û����޽��� */
                  , A.APP_TIME     /* ������¹߱��Ͻ� */
                  , A.APP_REG_ID   /* ������¹߱��� ID */
                  , A.TNO          /* �ŷ�������ȣ */
                  , A.BANK_NM      /* ����� */
                  , A.VACCOUNT     /* ������¹�ȣ */
                  , A.AMOUNT       /* ������û�ݾ� */
                  , A.VA_DATE      /* ������� �Աݸ����Ͻ� */
                  , A.TX_CD        /* ����ó�������ڵ� */
                  , A.TX_TM        /* ����ó���Ϸ��Ͻ� */
                  , A.OP_CD        /* �Աݰ���ڵ� */
                  , A.IPGM_TIME    /* �Ա��Ͻ� */
                  , A.REMITTER     /* �Ա��ڸ� */
                  , A.TOTAL_MNYX   /* �Աݱݾ��հ� */
                  , A.RECV_SEQ     /* �����ŷ���ȣ */
                  , A.USER_GRP     /* ����� �׷�(c001) */
                  , A.USER_GRP_NM  /* ����� �׷� �ڵ�� */
                  , CASE WHEN CORD_NO IS NULL THEN 'N' ELSE 'Y' END AS CMFP_YN
            FROM    (SELECT  DISTINCT ''                                    AS CHK
                           , B1.RVA_DAY
                           , B1.RVA_SEQ
                           , B1.CUST_NO
                           , B1.CUST_NM
                           , B1.TORD_NO
                           , 'P4'                                           AS RECP_PAY
                           , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P4') AS RECP_PAY_NM
                           , ''                                             AS WORK_SCOPE
                           , B1.RVA_AMT
                           , B1.RQST_STAT
                           , D1.CD_NM                                       AS RQST_STAT_NM
                           , TO_CHAR(B1.REG_DT, 'YYYYMMDDHH24MISS')         AS REG_DT
                           , B1.REG_ID
                           , B1.RES_CD
                           , B1.RES_MSG
                           , B1.APP_TIME
                           , B1.APP_REG_ID
                           , B1.TNO
                           , B1.BANK_NM
                           , B1.VACCOUNT
                           , B1.AMOUNT
                           , B1.VA_DATE
                           , C1.TX_CD
                           , C1.TX_TM
                           , C1.OP_CD
                           , C1.IPGM_TIME
                           , C1.REMITTER
                           , C1.TOTAL_MNYX
                           , B1.RECV_SEQ
                           , E1.USER_GRP
                           , F1.CD_NM                                       AS USER_GRP_NM
                           , G1.COL_01                                      AS CORD_NO
                     FROM    RTRE0141 A1 /* ���������ݼ��γ��� */
                           , RTRE0140 B1 /* ������� ���� */
                           , RTRE0142 C1 /* ������� �뺸���� */
                           , RTCM0051 D1 /* �����ڵ� Detail */
                           , RTCM0001 E1 /* ����� MASTER */
                           , RTCM0051 F1 /* �����ڵ� Detail */
                           , RTTEMPIWJ_190429_01 G1
                     WHERE   A1.RVA_DAY      = B1.RVA_DAY
                     AND     A1.RVA_SEQ      = B1.RVA_SEQ
                     AND     B1.TNO          = C1.TNO(+)
                     AND     B1.NOTI_SEQ     = C1.NOTI_SEQ(+)
                     AND     B1.RQST_STAT    = D1.CD(+)
                     AND     D1.CD_GRP_CD(+) = 'R052'
                     AND     B1.REG_ID       = E1.USER_ID(+)
                     AND     E1.USER_GRP     = F1.CD(+)
                     AND     F1.CD_GRP_CD(+) = 'C001'
                     AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY   BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                     AND     (v_Va_Fday     IS NULL OR (v_Va_Fday   IS NOT NULL AND B1.APP_TIME  BETWEEN v_Va_Fday   || '000001' AND v_Va_Tday   || '235959'))
                     AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME  BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                     AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.IPGM_TIME BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                     AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                     AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                     AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)
                     AND     B1.REG_ID       = DECODE(v_Reg_Id,    NULL, B1.REG_ID,    v_Reg_Id)
                     AND     (v_Tno         IS NULL OR B1.TNO        =  v_Tno)
                     AND     (v_Vaccount    IS NULL OR B1.VACCOUNT   =  v_Vaccount)
                     AND     (v_App_Reg_Id  IS NULL OR B1.APP_REG_ID =  v_App_Reg_Id)
                     AND     (v_Noti_Id     IS NULL OR C1.NOTI_ID    =  v_Noti_Id)
                     AND     (v_Remitter    IS NULL OR C1.REMITTER   =  v_Remitter)
                     AND     (v_User_Grp    IS NULL OR E1.USER_GRP   =  v_User_Grp)
                     AND     A1.ORD_NO       = G1.COL_01(+)

                     UNION ALL

                     SELECT  DISTINCT ''                                      AS CHK
                           , B1.RVA_DAY
                           , B1.RVA_SEQ
                           , B1.CUST_NO
                           , B1.CUST_NM
                           , B1.TORD_NO
                           , 'P5'                                             AS RECP_PAY
                           , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P5')   AS RECP_PAY_NM
                           , B1.WORK_SCOPE
                           , B1.RVA_AMT
                           , B1.RQST_STAT
                           , D1.CD_NM                                         AS RQST_STAT_NM
                           , TO_CHAR(B1.REG_DT, 'YYYYMMDDHH24MISS')           AS REG_DT
                           , B1.REG_ID
                           , '0000'                                           AS RES_CD
                           , PKG_RTCM0051.f_sRtcm0051CodeName('R028', '0000') AS RES_MSG
                           , B1.APP_TIME
                           , B1.APP_REG_ID
                           , B1.TNO
                           , B1.BANK_NM
                           , B1.VACCOUNT
                           , B1.AMOUNT
                           , B1.VA_DATE
                           , ''                                               AS TX_CD
                           , C1.TR_IL || C1.TR_SI                             AS TX_TM
                           , C1.INP_ST                                        AS OP_CD
                           , C1.TR_IL || C1.TR_SI                             AS IPGM_TIME
                           , C1.IACCT_NM                                      AS REMITTER
                           , C1.TR_AMT                                        AS TOTAL_MNYX
                           , B1.RECV_SEQ
                           , E1.USER_GRP
                           , F1.CD_NM                                         AS USER_GRP_NM
                           , G1.COL_01                                        AS CORD_NO
                     FROM    RTRE0221  A1 /* �������(VAN) ���γ��� */
                           , RTRE0220  B1 /* �������(VAN) ���� */
                           , VACS_AHST C1 /* ������� �ŷ����� ���� */
                           , RTCM0051  D1 /* �����ڵ� Detail */
                           , RTCM0001  E1 /* ����� MASTER */
                           , RTCM0051  F1 /* �����ڵ� Detail */
                           , RTTEMPIWJ_190429_01 G1
                     WHERE   A1.RVA_DAY      = B1.RVA_DAY
                     AND     A1.RVA_SEQ      = B1.RVA_SEQ
                     AND     B1.TR_DAY       = C1.TR_IL(+) --[20190604_01]
                     AND     B1.TNO          = C1.TR_NO(+)
                     AND     B1.RQST_STAT    = D1.CD(+)
                     AND     D1.CD_GRP_CD(+) = 'R052'
                     AND     B1.REG_ID       = E1.USER_ID(+)
                     AND     E1.USER_GRP     = F1.CD(+)
                     AND     F1.CD_GRP_CD(+) = 'C001'
                     AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY           BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                     AND     (v_Va_Fday     IS NULL OR (v_Va_Fday   IS NOT NULL AND B1.APP_TIME          BETWEEN v_Va_Fday   || '000001' AND v_Va_Tday   || '235959'))
                     AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME          BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                     AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.TR_IL || C1.TR_SI BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                     AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                     AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                     AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)
                     AND     B1.REG_ID       = DECODE(v_Reg_Id,    NULL, B1.REG_ID,    v_Reg_Id)
                     AND     (v_Tno         IS NULL OR B1.TNO        =  v_Tno)
                     AND     (v_Vaccount    IS NULL OR B1.VACCOUNT   =  v_Vaccount)
                     AND     (v_App_Reg_Id  IS NULL OR B1.APP_REG_ID =  v_App_Reg_Id)
                     AND     (v_Remitter    IS NULL OR C1.IACCT_NM   =  v_Remitter)
                     AND     (v_User_Grp    IS NULL OR E1.USER_GRP   =  v_User_Grp)
                     AND     A1.ORD_NO       = G1.COL_01(+)
                    ) A
            ORDER BY  A.RVA_DAY
                    , A.RVA_SEQ;
    END p_sRtre0140;

/*****************************************************************************
 -- ������� ��ü��ȸ

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.3     2018-01-05  wjim            [20180104_01] �ű԰��� (p_sRtre0140�� ���̽��� ����)
    1.4     2018-11-28  ncho            ��Ʋ��ũ ������ ������� �߰�
    1.5     2019-06-04  wjim            [20190604_01] �Ա����� �߰�
  *****************************************************************************/
    PROCEDURE p_sRtre0140OrdDelay(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                  , v_Cust_No   IN RTRE0140.CUST_NO%TYPE   /* ����ȣ */
                                  , v_Ord_No    IN RTRE0141.ORD_NO%TYPE    /* ����ȣ */
                                  , v_Dely_Day  IN RTRE0100.DELY_DAY%TYPE  /* ��ü�������� */
                                  , v_Rva_Fday  IN RTRE0140.RVA_DAY%TYPE   /* ��û����(from) */
                                  , v_Rva_Tday  IN RTRE0140.RVA_DAY%TYPE   /* ��û����(to) */
                                  , v_Rqst_Stat IN RTRE0140.RQST_STAT%TYPE /* ���� */
                                  , v_App_Fday  IN RTRE0140.APP_TIME%TYPE  /* ������� �߱���(from) */
                                  , v_App_Tday  IN RTRE0140.APP_TIME%TYPE  /* ������� �߱���(to) */
                                  , v_Ipgm_Fday IN RTRE0142.IPGM_TIME%TYPE /* �Ա���(from) */
                                  , v_Ipgm_Tday IN RTRE0142.IPGM_TIME%TYPE /* �Ա���(to) */
                                 )
  IS

  BEGIN
      OPEN Ref_Cursor FOR
          SELECT  A.RVA_DAY      /* ��û���� */
                , A.RVA_SEQ      /* ��û�Ϸù�ȣ */
                , A.CUST_NO      /* ����ȣ */
                , A.CUST_NM      /* ���� */
                , A.TORD_NO      /* ����û������ȣ */
                , A.ORD_NO       /* ����ȣ */
                , A.RECP_PAY     /* ��������ڵ� */
                , A.RECP_PAY_NM  /* ��������� */
                , A.WORK_SCOPE   /* �������� */
                , A.APPR_SCNT    /* ��üȸ�� */
                , A.PAY_DD_DELY  /* ������(��ü) */
                , A.PAY_DD_CUR   /* ������ */
                , A.RVA_AMT      /* ��û�ݾ� */
                , A.USER_GRP     /* ����� �׷�(c001) */
                , A.USER_GRP_NM  /* ����� �׷� �ڵ�� */
                , A.REG_ID       /* ����� ID */
                , A.RQST_STAT    /* ���� */
                , A.RQST_STAT_NM /* ���¸� */
                , A.RES_CD       /* ��û����ڵ� */
                , A.RES_MSG      /* ��û����޽��� */
                , A.APP_TIME     /* ������¹߱��Ͻ� */
                , A.APP_REG_ID   /* ������¹߱��� ID */
                , A.OP_CD        /* �Աݰ���ڵ� */
                , A.IPGM_TIME    /* �Ա��Ͻ� */
                , A.REMITTER     /* �Ա��ڸ� */
                , A.TOTAL_MNYX   /* �Աݱݾ��հ� */
          FROM    (SELECT  DISTINCT
                           B1.RVA_DAY
                         , B1.RVA_SEQ
                         , B1.CUST_NO
                         , B1.CUST_NM
                         , B1.TORD_NO
                         , A1.ORD_NO
                         , 'P4'                                           AS RECP_PAY
                         , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P4') AS RECP_PAY_NM
                         , ''                                             AS WORK_SCOPE
                         , G1.APPR_SCNT
                         , G1.PAY_DD                                      AS PAY_DD_DELY
                         , H1.PAY_DD                                      AS PAY_DD_CUR
                         , B1.RVA_AMT
                         , E1.USER_GRP
                         , F1.CD_NM                                       AS USER_GRP_NM
                         , B1.REG_ID
                         , B1.RQST_STAT
                         , D1.CD_NM                                       AS RQST_STAT_NM
                         , B1.RES_CD
                         , B1.RES_MSG
                         , B1.APP_TIME
                         , B1.APP_REG_ID
                         , C1.OP_CD
                         , C1.IPGM_TIME
                         , C1.REMITTER
                         , C1.TOTAL_MNYX
                   FROM    RTRE0141 A1 /* ���������� ���γ��� */
                         , RTRE0140 B1 /* ������� ���� */
                         , RTRE0142 C1 /* ������� �뺸���� */
                         , RTCM0051 D1 /* �����ڵ� Detail */
                         , RTCM0001 E1 /* ����� MASTER */
                         , RTCM0051 F1 /* �����ڵ� Detail */
                         , RTRE0100 G1 /* ��ü��� ���� ���� */
                         , RTSD0108 H1 /* ���� ���� */
                   WHERE   A1.RVA_DAY      = B1.RVA_DAY
                   AND     A1.RVA_SEQ      = B1.RVA_SEQ
                   AND     B1.TNO          = C1.TNO(+)
                   AND     B1.NOTI_SEQ     = C1.NOTI_SEQ(+)
                   AND     B1.RQST_STAT    = D1.CD(+)
                   AND     D1.CD_GRP_CD(+) = 'R052'
                   AND     B1.REG_ID       = E1.USER_ID(+)
                   AND     E1.USER_GRP     = F1.CD(+)
                   AND     F1.CD_GRP_CD(+) = 'C001'
                   AND     A1.ORD_NO       = G1.ORD_NO(+)
                   AND     G1.DELY_DAY(+)  = v_Dely_Day
                   AND     G1.RECP_TP(+)   = '11'
                   AND     A1.ORD_NO       = H1.ORD_NO(+)
                   AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY   BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                   AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME  BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                   AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.IPGM_TIME BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                   AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                   AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                   AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)

                   UNION ALL

                   SELECT  DISTINCT
                           B1.RVA_DAY
                         , B1.RVA_SEQ
                         , B1.CUST_NO
                         , B1.CUST_NM
                         , B1.TORD_NO
                         , A1.ORD_NO
                         , 'P5'                                             AS RECP_PAY
                         , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P5')   AS RECP_PAY_NM
                         , B1.WORK_SCOPE
                         , G1.APPR_SCNT
                         , G1.PAY_DD                                        AS PAY_DD_DELY
                         , H1.PAY_DD                                        AS PAY_DD_CUR
                         , B1.RVA_AMT
                         , E1.USER_GRP
                         , F1.CD_NM                                         AS USER_GRP_NM
                         , B1.REG_ID
                         , B1.RQST_STAT
                         , D1.CD_NM                                         AS RQST_STAT_NM
                         , '0000'                                           AS RES_CD
                         , PKG_RTCM0051.f_sRtcm0051CodeName('R028', '0000') AS RES_MSG
                         , B1.APP_TIME
                         , B1.APP_REG_ID
                         , C1.INP_ST                                        AS OP_CD
                         , C1.TR_IL || C1.TR_SI                             AS IPGM_TIME
                         , C1.IACCT_NM                                      AS REMITTER
                         , C1.TR_AMT                                        AS TOTAL_MNYX
                   FROM    RTRE0221  A1 /* �������(VAN) ���γ��� */
                         , RTRE0220  B1 /* �������(VAN) ���� */
                         , VACS_AHST C1 /* ������� �ŷ����� ���� */
                         , RTCM0051  D1 /* �����ڵ� Detail */
                         , RTCM0001  E1 /* ����� MASTER */
                         , RTCM0051  F1 /* �����ڵ� Detail */
                         , RTRE0100  G1 /* ��ü��� ���� ���� */
                         , RTSD0108  H1 /* ���� ���� */
                   WHERE   A1.RVA_DAY      = B1.RVA_DAY
                   AND     A1.RVA_SEQ      = B1.RVA_SEQ
                   AND     B1.TR_DAY       = C1.TR_IL(+) --[20190604_01]
                   AND     B1.TNO          = C1.TR_NO(+)
                   AND     B1.RQST_STAT    = D1.CD(+)
                   AND     D1.CD_GRP_CD(+) = 'R052'
                   AND     B1.REG_ID       = E1.USER_ID(+)
                   AND     E1.USER_GRP     = F1.CD(+)
                   AND     F1.CD_GRP_CD(+) = 'C001'
                   AND     A1.ORD_NO       = G1.ORD_NO(+)
                   AND     G1.DELY_DAY(+)  = v_Dely_Day
                   AND     G1.RECP_TP(+)   = '11'
                   AND     A1.ORD_NO       = H1.ORD_NO(+)
                   AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY           BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                   AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME          BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                   AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.TR_IL || C1.TR_SI BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                   AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                   AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                   AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)
                  ) A
          ORDER BY  A.RVA_DAY
                  , A.RVA_SEQ;

  END p_sRtre0140OrdDelay;

  /*****************************************************************************
  -- ������� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0140 (
      v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* ����ȣ              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* ����                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* ����û������ȣ      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* ��û�ݾ�              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* ����                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* ������� �߱���ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* �뺸����              */
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* �����ŷ���ȣ          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */
    , v_Rva_Day        OUT VARCHAR2
    , v_Rva_Seq        OUT NUMBER
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

    ls_Rva_Day    RTRE0140.RVA_DAY%TYPE;
    ln_Rva_Seq    RTRE0140.RVA_SEQ%TYPE;

  BEGIN

    /*
     * ��û���� ȹ��
     */
    SELECT  TO_CHAR(SYSDATE, 'YYYYMMDD')
      INTO  ls_Rva_Day
      FROM  DUAL;

    /*
     * ��û�Ϸù�ȣ ȹ��
     */
    SELECT  NVL2(MAX(RVA_SEQ), TO_NUMBER(MAX(RVA_SEQ))+1, 1)
      INTO  ln_Rva_Seq
      FROM  RTRE0140
     WHERE  RVA_DAY = ls_Rva_Day;

    INSERT  INTO RTRE0140 (
          RVA_DAY
        , RVA_SEQ
        , CUST_NO
        , CUST_NM
        , TORD_NO
        , RVA_AMT
        , RQST_STAT
        , EXPIRE_TERM
        , EXPIRE_TIME
        , RES_CD
        , RES_MSG
        , TNO
        , AMOUNT
        , BANK_CD
        , BANK_NM
        , VACCOUNT
        , VA_DATE
        , APP_TIME
        , APP_REG_ID
        , NOTI_SEQ
        , RECV_SEQ
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          ls_Rva_Day        /* ��û����              */
        , ln_Rva_Seq        /* ��û�Ϸù�ȣ          */
        , v_Cust_No         /* ����ȣ              */
        , v_Cust_Nm         /* ����                */
        , v_Tord_No         /* ����û������ȣ      */
        , v_Rva_Amt         /* ��û�ݾ�              */
        , v_Rqst_Stat       /* ����                  */
        , v_Expire_Term     /* ��ȿ�Ⱓ              */
        , v_Expire_Time     /* ��ȿ�ð�              */
        , v_Res_Cd          /* ��û����ڵ�          */
        , v_Res_Msg         /* ��û����޽���        */
        , v_Tno             /* �ŷ�������ȣ          */
        , v_Amount          /* ������û�ݾ�          */
        , v_Bank_Cd         /* �����ڵ�              */
        , v_Bank_Nm         /* �����                */
        , v_Vaccount        /* ������¹�ȣ          */
        , v_Va_Date         /* ������� �Աݸ����Ͻ� */
        , v_App_Time        /* ������� �߱��Ͻ�     */
        , v_App_Reg_Id      /* ������� �߱���ID     */
        , v_Noti_Seq        /* �뺸����              */
        , v_Recv_Seq        /* �����ŷ���ȣ          */
        , v_Reg_Id          /* �����ID              */
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );

    v_Rva_Seq := ln_Rva_Seq;
    v_Rva_Day := ls_Rva_Day;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0140;

  /*****************************************************************************
  -- ������� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140 (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* ��û����              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* ��û�Ϸù�ȣ          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* ����ȣ              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* ����                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* ����û������ȣ      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* ��û�ݾ�              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* ����                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* ������� �߱���ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* �뺸����              */
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* �����ŷ���ȣ          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTRE0140
       SET  RVA_DAY     = v_Rva_Day         /* ��û����              */
         ,  RVA_SEQ     = v_Rva_Seq         /* ��û�Ϸù�ȣ          */
         ,  CUST_NO     = v_Cust_No         /* ����ȣ              */
         ,  CUST_NM     = v_Cust_Nm         /* ����                */
         ,  TORD_NO     = v_Tord_No         /* ����û������ȣ      */
         ,  RVA_AMT     = v_Rva_Amt         /* ��û�ݾ�              */
         ,  RQST_STAT   = v_Rqst_Stat       /* ����                  */
         ,  EXPIRE_TERM = v_Expire_Term     /* ��ȿ�Ⱓ              */
         ,  EXPIRE_TIME = v_Expire_Time     /* ��ȿ�ð�              */
         ,  RES_CD      = v_Res_Cd          /* ��û����ڵ�          */
         ,  RES_MSG     = v_Res_Msg         /* ��û����޽���        */
         ,  TNO         = v_Tno             /* �ŷ�������ȣ          */
         ,  AMOUNT      = v_Amount          /* ������û�ݾ�          */
         ,  BANK_CD     = v_Bank_Cd         /* �����ڵ�              */
         ,  BANK_NM     = v_Bank_Nm         /* �����                */
         ,  VACCOUNT    = v_Vaccount        /* ������¹�ȣ          */
         ,  VA_DATE     = v_Va_Date         /* ������� �Աݸ����Ͻ� */
         ,  APP_TIME    = v_App_Time        /* ������� �߱��Ͻ�     */
         ,  APP_REG_ID  = v_App_Reg_Id      /* ������� �߱��Ͻ�     */
         ,  NOTI_SEQ    = v_Noti_Seq        /* �뺸����              */
         ,  RECV_SEQ    = v_Recv_Seq        /* �����ŷ���ȣ          */
         ,  CHG_ID      = v_Reg_Id
         ,  CHG_DT      = SYSDATE
     WHERE  RVA_DAY     = v_Rva_Day
       AND  RVA_SEQ     = v_Rva_Seq
    ;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0140;

  /*****************************************************************************
  -- ������� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0140 (
      v_Comm_Dvsn       IN CHAR                      /* ó������(I,U,D)       */
    , v_Rva_Day     IN OUT RTRE0140.RVA_DAY%TYPE     /* ��û����              */
    , v_Rva_Seq     IN OUT RTRE0140.RVA_SEQ%TYPE     /* ��û�Ϸù�ȣ          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* ����ȣ              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* ����                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* ����û������ȣ      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* ��û�ݾ�              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* ����                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* ������� �߱���ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* �뺸����              */
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* �����ŷ���ȣ          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '����ȣ : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0140 (
              v_Cust_No         /* ����ȣ              */
            , v_Cust_Nm         /* ����                */
            , v_Tord_No         /* ����û������ȣ      */
            , v_Rva_Amt         /* ��û�ݾ�              */
            , v_Rqst_Stat       /* ����                  */
            , v_Expire_Term     /* ��ȿ�Ⱓ              */
            , v_Expire_Time     /* ��ȿ�ð�              */
            , v_Res_Cd          /* ��û����ڵ�          */
            , v_Res_Msg         /* ��û����޽���        */
            , v_Tno             /* �ŷ�������ȣ          */
            , v_Amount          /* ������û�ݾ�          */
            , v_Bank_Cd         /* �����ڵ�              */
            , v_Bank_Nm         /* �����                */
            , v_Vaccount        /* ������¹�ȣ          */
            , v_Va_Date         /* ������� �Աݸ����Ͻ� */
            , v_App_Time        /* ������� �߱��Ͻ�     */
            , v_App_Reg_Id      /* ������� �߱���ID     */
            , v_Noti_Seq        /* �뺸����              */
            , v_Recv_Seq        /* �����ŷ���ȣ          */
            , v_Reg_Id          /* �����ID              */
            , v_Rva_Day
            , v_Rva_Seq
            , v_ErrorText
        ) THEN
            v_Return_Message := '������� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0140 (
              v_Rva_Day         /* ��û����              */
            , v_Rva_Seq         /* ��û�Ϸù�ȣ          */
            , v_Cust_No         /* ����ȣ              */
            , v_Cust_Nm         /* ����                */
            , v_Tord_No         /* ����û������ȣ      */
            , v_Rva_Amt         /* ��û�ݾ�              */
            , v_Rqst_Stat       /* ����                  */
            , v_Expire_Term     /* ��ȿ�Ⱓ              */
            , v_Expire_Time     /* ��ȿ�ð�              */
            , v_Res_Cd          /* ��û����ڵ�          */
            , v_Res_Msg         /* ��û����޽���        */
            , v_Tno             /* �ŷ�������ȣ          */
            , v_Amount          /* ������û�ݾ�          */
            , v_Bank_Cd         /* �����ڵ�              */
            , v_Bank_Nm         /* �����                */
            , v_Vaccount        /* ������¹�ȣ          */
            , v_Va_Date         /* ������� �Աݸ����Ͻ� */
            , v_App_Time        /* ������� �߱��Ͻ�     */
            , v_App_Reg_Id      /* ������� �߱���ID     */
            , v_Noti_Seq        /* �뺸����              */
            , v_Recv_Seq        /* �����ŷ���ȣ          */
            , v_Reg_Id          /* �����ID              */
            , v_ErrorText
        ) THEN
            v_Return_Message := '������� ���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_IUDRtre0140(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_IUDRtre0140(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0140;

  /*****************************************************************************
  -- ������� ��û��� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.1     2017-10-27  wjim            [20170227_01] ������� �߱� SMS �߼� �߰�
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0140ReqResult (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* ��û����              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* ��û�Ϸù�ȣ          */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ls_Cust_Nm      RTRE0140.CUST_NM%TYPE;          /*����                  */
    ls_Mob_No       RTSD0100.MOB_NO%TYPE;           /*SMS�߼۹�ȣ=�� �޴��� */
    ls_Sms_Msg      RTSD0205.SND_MSG%TYPE;          /*�߼� SMS�޽���          */

    e_Error EXCEPTION;

  BEGIN

    UPDATE  RTRE0140
       SET  RQST_STAT   = DECODE(v_Res_Cd,'0000','3','2')
         ,  EXPIRE_TERM = v_Expire_Term
         ,  EXPIRE_TIME = v_Expire_Time
         ,  RES_CD      = v_Res_Cd
         ,  RES_MSG     = v_Res_Msg
         ,  TNO         = v_Tno
         ,  AMOUNT      = v_Amount
         ,  BANK_CD     = v_Bank_Cd
         ,  BANK_NM     = v_Bank_Nm
         ,  VACCOUNT    = v_Vaccount
         ,  VA_DATE     = v_Va_Date
         ,  APP_TIME    = v_App_Time
         ,  APP_REG_ID  = v_Reg_Id
         ,  CHG_ID      = v_Reg_Id
         ,  CHG_DT      = SYSDATE
     WHERE  RVA_DAY     = v_Rva_Day
       AND  RVA_SEQ     = v_Rva_Seq;

    /*
     * SMS �߼� [20170227_01]
     */
    SELECT  A1.CUST_NM
         ,  B1.MOB_NO
      INTO  ls_Cust_Nm
         ,  ls_Mob_No
      FROM  RTRE0140 A1
         ,  RTSD0100 B1
     WHERE  A1.RVA_DAY = v_Rva_Day
       AND  A1.RVA_SEQ = v_Rva_Seq
       AND  A1.CUST_NO = B1.CUST_NO;

    ls_Sms_Msg := '[�ؼ�Ÿ�̾�] �ȳ��ϼ��� '||ls_Cust_Nm||'����, �ؽ�Ʈ�����Դϴ�. ��û�Ͻ� ������� ���� �ȳ��帳�ϴ�.';
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'�������� : '||v_Bank_Nm;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'���¹�ȣ : '||v_Vaccount;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'�Ա��ڸ� : '||ls_Cust_Nm;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'�Աݱݾ� : '||TRIM(TO_CHAR(v_Amount, '999,999,999,999'))||'��';
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'���� ��ȿ�Ⱓ : '||REGEXP_REPLACE(SUBSTR(v_Va_Date, 1, 12), '(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})', '\1�� \2�� \3�� \4�� \5��')||' ����';

    NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
          'I'               /*���� ���ۿ���         */
        , '00000000000000'  /*���� ���۽ð�         */
        , ls_Mob_No         /*�޴� ��ȭ��ȣ         */
        , '18550100'        /*������ ��ȭ��ȣ       */
        , ls_Sms_Msg        /*�޽�������            */
        , 'S032'            /*��������� �ʵ�       */
        , v_Tno             /*��������� �ʵ�       */
        , '2'
        , 'RENTAL00000000000012'
        , v_Reg_Id          /*����� ID             */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '������¹߱� SMS �߼� ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_UpdateRtre0140ReqResult(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_UpdateRtre0140ReqResult(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0140ReqResult;

  /*****************************************************************************
  -- ������� �Ա� ����ó�� ��� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140RecvResult (
      v_Rva_Day        IN RTRE0140.RVA_DAY%TYPE       /*��û����              */
    , v_Rva_Seq        IN RTRE0140.RVA_SEQ%TYPE       /*��û�Ϸù�ȣ          */
    , v_Noti_Seq       IN RTRE0140.NOTI_SEQ%TYPE      /*�뺸����              */
    , v_Recv_Seq       IN RTRE0140.RECV_SEQ%TYPE      /*�����ŷ���ȣ          */
    , v_Reg_Id         IN RTRE0140.REG_ID%TYPE        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTRE0140
       SET  RQST_STAT = '6'
         ,  NOTI_SEQ  = v_Noti_Seq
         ,  RECV_SEQ  = v_Recv_Seq
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  RVA_DAY   = v_Rva_Day
       AND  RVA_SEQ   = v_Rva_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0140RecvResult;

END PKG_RTRE0140;
/
