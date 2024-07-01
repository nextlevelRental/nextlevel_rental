CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0110SEC AS
/*******************************************************************************
    NAME    : Pkg_Rtcm0110
    PURPOSE : ��Ż������ ���� ����
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-14  sunq             1. Created this package spec.
 *******************************************************************************/
   /*******************************************************************************
     -- ����� RTCM0001���� ��Ż������ ��ȸ COMBOBOX ��� 
    *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterCBList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                          , v_Cd_Grp_Cd IN RTCM0051.CD_GRP_CD%TYPE        /* �ڵ� �׷� �ڵ� */
                                          , v_Cd_Nm     IN RTCM0051.CD_NM%TYPE            /* �ڵ�� */
                                         );
   /*******************************************************************************
    -- ����� RTCM0050���� ��Ż ���� / ���� ��ȸ COMBOBOX ���
    *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterHoBoList(  Ref_Cursor    IN OUT SYS_REFCURSOR
                                            , v_Cd_Grp_Cd1  IN RTCM0050.CD_GRP_CD%TYPE        /* �ڵ� �׷� �ڵ�1 */
                                            , v_Cd_Grp_Cd2  IN RTCM0050.CD_GRP_CD%TYPE        /* �ڵ� �׷� �ڵ�2 */
                                           );
   /*******************************************************************************
    -- ��Ż ������ ���� �˻�
    *******************************************************************************/
    PROCEDURE p_sRtcm0001_RtlMasterList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                        , v_User_Nm   IN RTCM0001.USER_NM%TYPE        /* ��Ż ������ �̸� */
                                        , v_User_Id   IN RTCM0001.USER_ID%TYPE        /* ��Ż ������ ID */
                                      );
   /*******************************************************************************
    -- RTCM0110 ��Ż ���� ���� �˻�
    *******************************************************************************/
    PROCEDURE p_sRtcm0110_RtlHOBOList(  Ref_Cursor     IN OUT SYS_REFCURSOR
                                      , v_Rnt_Ofc_Nm   IN RTCM0051.CD_NM%TYPE        /* ��Ż ����� */
                                      , v_Rnt_Pnt_Nm   IN RTCM0051.CD_NM%TYPE        /* ��Ż ������ */
                                      , v_Ofc_Cd       IN RTCM0110.RNT_OFC%TYPE      /* ��Ż ���� �ڵ� */
                                      , v_Pnt_Cd       IN RTCM0110.RNT_PNT%TYPE      /* ��Ż ���� �ڵ� */
                                    );
END Pkg_Rtcm0110SEC;
/
