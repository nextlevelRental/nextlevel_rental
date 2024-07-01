CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0230 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0230
    PURPOSE : �ߵ��ϳ�������ȸ
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-10  sunq             1. Created this package body.
 *******************************************************************************/

/*******************************************************************************
 -- �ߵ��ϳ�/���� ������ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0230_fullPayRehisList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                           , v_Cnc_F_Day  IN RTRE0230.CNC_DAY%TYPE    /* ������� StartDay */
                                           , v_Cnc_T_Day  IN RTRE0230.CNC_DAY%TYPE    /* ������� EndDay */
                                           , v_Ord_No     IN RTRE0230.ORD_NO%TYPE     /* ����ȣ */
                                           , v_Cust_No    IN RTRE0230.CUST_NO%TYPE    /* ����ȣ */
                                           , v_Mfp_Cd     IN RTRE0230.MFP_CD%TYPE     /* ���� */
                                           , v_Mfp_Rsn_Cd IN RTRE0230.MFP_RSN_CD%TYPE /* �ϳ�/�������� */
                                          )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.ORD_NO                                                                /* ����ȣ */
                  , A.CNC_DAY                                                               /* ������� */
                  , A.RECV_DAY                                                              /* �������� */
                  , Pkg_Rtcm0051.f_sRtcm0051Codename('S070', A.MFP_CD)     AS MFP_CD_NM     /* �������� */
                  , A.PROC_DAY                                                              /* �������� */
                  , A.CUST_NO                                                               /* ����ȣ */
                  , Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)            AS CUST_NM       /* ���� */
                  , A.TOT_RENT_AMT                                                          /* �ѷ�Ż�� */
                  , A.RECV_AMT                                                              /* �����ݾ� */
                  , A.PNLT_AMT                                                              /* ����� */
                  , A.TOT_RECV_AMT                                                          /* �Ѽ����ݾ� */
                  , A.RECV_RT                                                               /* ȸ���� */
                  , Pkg_Rtcm0051.f_sRtcm0051Codename('R053', A.MFP_RSN_CD) AS MFP_RSN_CD_NM /* �ϳ��������� */
                  , A.MFP_DESC                                                              /* �󼼻��� */
            FROM    RTRE0230 A                                                              /* �ߵ��ϳ��������� */
            WHERE   A.CNC_DAY BETWEEN v_Cnc_F_Day
                              AND     v_Cnc_T_Day
            AND     A.ORD_NO        = DECODE(v_Ord_No,     NULL, A.ORD_NO,     v_Ord_No)
            AND     A.CUST_NO       = DECODE(v_Cust_No,    NULL, A.CUST_NO,    v_Cust_No)
            AND     A.MFP_CD        = DECODE(v_Mfp_Cd,     NULL, A.MFP_CD,     v_Mfp_Cd)
            AND     A.MFP_RSN_CD    = DECODE(v_Mfp_Rsn_Cd, NULL, A.MFP_RSN_CD, v_Mfp_Rsn_Cd)
            ORDER BY A.MFP_SEQ,A.ORD_NO;
    END p_sRtre0230_fullPayRehisList;

/*******************************************************************************
 -- �ߵ��ϳ����� ä��
 *******************************************************************************/
    FUNCTION f_sRtre0230MfpSeq
    RETURN NUMBER

    IS

    v_Mfp_Seq RTRE0230.MFP_SEQ%TYPE DEFAULT 0; /* �ߵ��ϳ����� */

    BEGIN
        SELECT NVL2(MAX(MFP_SEQ), TO_NUMBER(MAX(MFP_SEQ)) + 1, 1)
        INTO   v_Mfp_Seq
        FROM   RTRE0230;
        RETURN v_Mfp_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0230MfpSeq;

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
                                          )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0230(  MFP_SEQ
                             , ORD_NO
                             , CUST_NO
                             , CNC_DAY
                             , RECV_MON
                             , RECV_DAY
                             , MFP_CD
                             , PROC_DAY
                             , TOT_RENT_AMT
                             , RECV_AMT
                             , PNLT_AMT
                             , SERV_AMT
                             , TOT_RECV_AMT
                             , RECV_RT
                             , RECP_PAY
                             , RECV_SEQ
                             , MFP_RSN_CD
                             , MFP_DESC
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Mfp_Seq
                             , v_Ord_No
                             , v_Cust_No
                             , v_Cnc_Day
                             , v_Recv_Mon
                             , v_Cnc_Day
                             , v_Mfp_Cd
                             , v_Proc_Day
                             , v_Tot_Rent_Amt
                             , v_Recv_Amt
                             , v_Pnlt_Amt
                             , v_Serv_Amt
                             , v_Tot_Recv_Amt
                             , v_Recv_Rt
                             , v_Recp_Pay
                             , v_Recv_Seq
                             , v_Mfp_Rsn_Cd
                             , v_Mfp_Desc
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0230.p_InsertRtsd0230MidFullPymnt(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '����!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0230.p_InsertRtsd0230MidFullPymnt(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtsd0230MidFullPymnt;

/*******************************************************************************
 -- �����ݰ��� Seq ��ȸ
 *******************************************************************************/
    PROCEDURE p_sRtre0035SeqList(  Ref_Cursor       IN OUT SYS_REFCURSOR
                                 , v_Ord_No         IN RTRE0035.ORD_NO%TYPE  /* ����ȣ */
                                )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  TO_CHAR(SYSDATE, 'YYYYMMDD') AS RCRD_DAY
                  , TO_CHAR(SYSDATE, 'YYYYMMDD') AS RACT_DAY
                  , RECV_SEQ
                  , RITM_SEQ
            FROM    RTRE0035
            WHERE   PND_STAT <> 'S'
            AND     ORD_NO    = v_Ord_No;
    END p_sRtre0035SeqList;

/*******************************************************************************
 -- �ߵ��ϳ�ȯ�Ҵ�󳻿���ȸ Select
 *******************************************************************************/
    PROCEDURE p_sRtre0230MfpRfndTrgtList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Recv_Mon IN RTRE0230.RECV_MON%TYPE /* ����� */
                                         , v_Mfp_Cd   IN RTRE0230.MFP_CD%TYPE   /* ����������� */
                                        )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.MFP_SEQ                                                               /* �ߵ��ϳ����� */
                  , A.CNC_DAY                                                               /* �ߵ��ϳ����� */
                  , A.MFP_CD                                                                /* ������������ڵ� */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('S070', A.MFP_CD)   AS MFP_CD_NM       /* ������������� */
                  , A.ORD_NO                                                                /* ����ȣ */
                  , A.CUST_NO                                                               /* ����ȣ */
                  , Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)          AS CUST_NM         /* ���� */
                  , (B.PND_AMT - B.SBS_AMT)                              AS DBL_WTH_AMT     /* ������ݱݾ�*/
                  , B.RECP_PAY                                                              /* ���������ڵ� */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R019', B.RECP_PAY) AS RECP_PAY_NM     /* ���������� */
                  , C.RECV_DAY                                                              /* �������� */
                  , A.RECP_PAY                                           AS MFP_RECP_PAY    /* �ߵ��ϳ� ���������ڵ� */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R019', A.RECP_PAY) AS MFP_RECP_PAY_NM /* �ߵ��ϳ� �������� */
                  , (CASE WHEN A.RECP_PAY = 'P7' THEN D.RECV_SEQ
                          WHEN A.RECP_PAY = 'P6' THEN E.RECV_SEQ
                     END
                    )                                                    AS RECV_SEQ        /* �����ŷ���ȣ */
                  , (CASE WHEN A.RECP_PAY = 'P7' THEN D.TNO
                          WHEN A.RECP_PAY = 'P6' THEN E.TNO
                     END
                    )                                                    AS TNO             /* �ŷ���ȣ */
                  , (CASE WHEN A.RECP_PAY = 'P7' THEN D.PRT_CNC_RMNN_AMT
                          WHEN A.RECP_PAY = 'P6' THEN E.PRT_CNC_RMNN_AMT
                     END
                    )                                                    AS ORGN_TR_AMT     /* ���ŷ��ݾ� */
                  , (CASE WHEN A.RECP_PAY = 'P6' THEN E.P_OID_SEQ
                                                 ELSE NULL
                     END
                    )                                                    AS P_OID_SEQ       /* �ֹ��Ϸù�ȣ */
            FROM    RTRE0230 A
                  , RTRE0035 B
                  , RTRE0030 C
                  , RTRE0200 D
                  , RTRE0210 E
            WHERE   A.ORD_NO    = B.ORD_NO
            AND     A.CUST_NO   = B.CUST_NO
            AND     B.RECV_SEQ  = C.RECV_SEQ
            AND     B.RITM_SEQ  = C.RITM_SEQ
            AND     A.ORD_NO    = D.TORD_NO(+)
            AND     A.CUST_NO   = D.CUST_NO(+)
            AND     A.RECV_SEQ  = D.RECV_SEQ(+)
            AND     A.ORD_NO    = E.TORD_NO(+)
            AND     A.CUST_NO   = E.CUST_NO(+)
            AND     A.RECV_SEQ  = E.RECV_SEQ(+)
            AND     A.RECP_PAY IN ('P6','P7')
            AND     B.RECP_PAY IN ('C1','C2')
            AND     B.PND_STAT <> 'S'
            AND     A.RECV_MON  = v_Recv_Mon
            AND     A.MFP_CD    = DECODE(v_Mfp_Cd, NULL, A.MFP_CD, v_Mfp_Cd)
            ORDER BY A.MFP_SEQ,A.ORD_NO;
    END p_sRtre0230MfpRfndTrgtList;
END Pkg_Rtre0230;
/
