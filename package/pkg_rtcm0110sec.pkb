CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0110SEC AS
/*******************************************************************************
    NAME    : Pkg_Rtcm0110SEC
    PURPOSE : ��Ż������ ���� ����
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-18  sunq             1. Created this package body.
 *******************************************************************************/
    /*******************************************************************************
    -- ����� RTCM0001���� ��Ż������ ��ȸ COMBOBOX ��� 
    *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterCBList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                          , v_Cd_Grp_Cd  IN RTCM0051.CD_GRP_CD%TYPE        /* �ڵ� �׷� �ڵ� */
                                          , v_Cd_Nm      IN RTCM0051.CD_NM%TYPE            /* �ڵ�� */
                                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT A.ORDER_PT   /* �켱���� */
                 , A.CD_NM      /* �ڵ�� */
                 , A.CD         /* �ڵ� */
              FROM RTCM0051 A
             WHERE A.USE_YN = 'Y' 
                    AND A.CD_GRP_CD = DECODE(v_Cd_Grp_Cd, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd)
                    AND A.CD_NM LIKE '%' || v_Cd_Nm || '%'
          ORDER BY A.ORDER_PT ASC;
    END p_sRtcm0051_RtlMasterCBList;
    /*******************************************************************************
     ����� RTCM0050���� ��Ż ���� / ���� ��ȸ COMBOBOX ���
     *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterHoBoList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                          , v_Cd_Grp_Cd1  IN RTCM0050.CD_GRP_CD%TYPE        /* �ڵ� �׷� �ڵ�1 */
                                          , v_Cd_Grp_Cd2  IN RTCM0050.CD_GRP_CD%TYPE        /* �ڵ� �׷� �ڵ�2 */
                                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT A.CD_GRP_CD    /* �ڵ�׷��ڵ� */
                 , A.CD_GRP_NM    /* �ڵ�׷�� */
              FROM RTCM0050 A
             WHERE A.USE_YN = 'Y'
                    AND A.CD_GRP_CD IN (
                        DECODE(v_Cd_Grp_Cd1, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd1)
                      , DECODE(v_Cd_Grp_Cd2, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd2)
                     )
          ORDER BY CD_GRP_CD ASC;
    END p_sRtcm0051_RtlMasterHoBoList;
    /*******************************************************************************
     -- ��Ż ������ ���� �˻�
     *******************************************************************************/
    PROCEDURE p_sRtcm0001_RtlMasterList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                        , v_User_Nm   IN RTCM0001.USER_NM%TYPE        /* ��Ż ������ �̸� */
                                        , v_User_Id   IN RTCM0001.USER_ID%TYPE        /* ��Ż ������ ID */
                                      )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT A.USER_ID
                 , A.USER_NM
              FROM RTCM0001 A
             WHERE A.LOCK_YN = 'N'
                    AND A.USER_GRP = 'RM'
                    AND A.USER_ID = DECODE(v_User_Id, NULL, A.USER_ID, v_User_Id)
                    AND A.USER_NM LIKE '%' || v_User_Nm || '%';
    END p_sRtcm0001_RtlMasterList;
    /*******************************************************************************
     RTCM0110 ��Ż ���� ���� �˻�
     *******************************************************************************/
    /*******************************************************************************
     RTCM0110 ��Ż ���� ���� �˻�
     *******************************************************************************/
    PROCEDURE p_sRtcm0110_RtlHOBOList(  Ref_Cursor       IN OUT SYS_REFCURSOR
                                        , v_Rnt_Ofc_Nm   IN RTCM0051.CD_NM%TYPE        /* ��Ż ������ �̸� */
                                        , v_Rnt_Pnt_Nm   IN RTCM0051.CD_NM%TYPE        /* ��Ż ������ ID */
                                        , v_Ofc_Cd       IN RTCM0110.RNT_OFC%TYPE      /* ��Ż ���� �ڵ� */
                                        , v_Pnt_Cd       IN RTCM0110.RNT_PNT%TYPE      /* ��Ż ���� �ڵ� */
                                      )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT C.RNT_MST_ID                 /* ��Ż ������ ID */
                 , B.CD_GRP_CD AS OFC_GRP_CD    /* �׷� ��Ż ���� �ڵ� */
                 , A.CD_GRP_CD AS PNT_GRP_CD    /* �׷� ��Ż ���� �ڵ� */
                 , B.CD AS OFC_CD               /* ��Ż ���� �ڵ� */
                 , B.CD_NM AS OFC_NM            /* ��Ż ���� �� */
                 , A.CD AS PNT_CD               /* ��Ż ���� �ڵ� */
                 , A.CD_NM AS PNT_NM            /* ��Ż ���� �� */
              FROM RTCM0051 A 
                    INNER JOIN RTCM0051 B ON
                        B.CD_GRP_CD = A.RFR_1
                        AND B.CD = A.RFR_2
                    LEFT OUTER JOIN RTCM0110 C ON
                        B.CD = C.RNT_OFC
                        AND A.CD = C.RNT_PNT
            WHERE 1=1
                  AND A.CD_GRP_CD = 'S302'
                  AND A.RFR_1 = 'S301'
                  AND B.CD IN (SELECT A.CD
                                 FROM RTCM0051 A
                                WHERE A.USE_YN = 'Y'
                                      AND A.CD_GRP_CD = 'S301'
                                      AND A.CD_NM LIKE '%' || v_Rnt_Ofc_Nm || '%')
                AND A.CD IN (SELECT A.CD
                               FROM RTCM0051 A
                              WHERE A.USE_YN = 'Y'
                                    AND A.CD_GRP_CD = 'S302'
                                    AND A.CD_NM LIKE '%' || v_Rnt_Pnt_Nm || '%')
                AND A.CD = DECODE(v_Pnt_Cd, NULL, A.CD, v_Pnt_Cd) 
                AND B.CD = DECODE(v_Ofc_Cd, NULL, B.CD, v_Ofc_Cd)
            ORDER BY
                    B.CD,
                    A.CD;
    END p_sRtcm0110_RtlHOBOList;

END Pkg_Rtcm0110SEC;
/
