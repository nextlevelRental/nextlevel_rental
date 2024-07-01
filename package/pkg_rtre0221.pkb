CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0221 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0221
   PURPOSE : ������� ���γ��� ����(��Ʋ��ũ ������ �������)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-28  ncho             1. Created this package spec.
 *******************************************************************************/
/*****************************************************************************
 -- ������� ���γ��� Select
 *****************************************************************************/
    PROCEDURE p_sRtre0221(  Ref_Cursor IN OUT SYS_REFCURSOR
                          , v_Rva_Day  IN RTRE0221.RVA_DAY%TYPE /* ��û���� */
                          , v_Rva_Seq  IN RTRE0221.RVA_SEQ%TYPE /* ��û�Ϸù�ȣ */
                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A1.RVA_DAY             /* ��û���� */
                  , A1.RVA_SEQ             /* ��û�Ϸù�ȣ */
                  , A1.CUST_NO             /* ����ȣ */
                  , A1.TORD_NO             /* ����û������ȣ */
                  , A1.ORD_NO              /* ����ȣ */
                  , A1.SCHD_SEQ            /* û������ */
                  , A1.RECP_TP             /* û�������ڵ� */
                  , B1.CD_NM AS RECP_TP_NM /* û�����и� */
                  , A1.DEMD_DT             /* û������ */
                  , A1.ZFBDT               /* ����������� */
                  , A1.SALE_AMT            /* ����ݾ� */
                  , A1.ARRE_AMT            /* ��ü�ݾ� */
                  , A1.REG_ID              /* ����� ID */
                  , A1.REG_DT              /* ����� */
                  , A1.CHG_ID              /* ������ ID */
                  , A1.CHG_DT              /* ������ */
            FROM    RTRE0221 A1 /* �������(VAN) ���γ��� */
                  , RTCM0051 B1 /* �����ڵ� Detail */
            WHERE   A1.RVA_DAY      = DECODE(v_Rva_Day, NULL, A1.RVA_DAY, v_Rva_Day)
            AND     A1.RVA_SEQ      = DECODE(v_Rva_Seq, NULL, A1.RVA_SEQ, v_Rva_Seq)
            AND     A1.RECP_TP      = B1.CD(+)
            AND     B1.CD_GRP_CD(+) = 'R007'
            ORDER BY  A1.RVA_DAY
                    , A1.RVA_SEQ
                    , A1.SCHD_SEQ;
    END p_sRtre0221;
END PKG_RTRE0221;
/
