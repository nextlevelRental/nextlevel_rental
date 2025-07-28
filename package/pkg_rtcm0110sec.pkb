CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0110SEC AS
/*******************************************************************************
    NAME    : Pkg_Rtcm0110SEC
    PURPOSE : 렌탈마스터 권한 설정
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-18  sunq             1. Created this package body.
 *******************************************************************************/
    /*******************************************************************************
    -- 사용자 RTCM0001에서 렌탈마스터 조회 COMBOBOX 사용 
    *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterCBList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                          , v_Cd_Grp_Cd  IN RTCM0051.CD_GRP_CD%TYPE        /* 코드 그룹 코드 */
                                          , v_Cd_Nm      IN RTCM0051.CD_NM%TYPE            /* 코드명 */
                                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT A.ORDER_PT   /* 우선순위 */
                 , A.CD_NM      /* 코드명 */
                 , A.CD         /* 코드 */
              FROM RTCM0051 A
             WHERE A.USE_YN = 'Y' 
                    AND A.CD_GRP_CD = DECODE(v_Cd_Grp_Cd, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd)
                    AND A.CD_NM LIKE '%' || v_Cd_Nm || '%'
          ORDER BY A.ORDER_PT ASC;
    END p_sRtcm0051_RtlMasterCBList;
    /*******************************************************************************
     사용자 RTCM0050에서 렌탈 지사 / 지점 조회 COMBOBOX 사용
     *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterHoBoList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                          , v_Cd_Grp_Cd1  IN RTCM0050.CD_GRP_CD%TYPE        /* 코드 그룹 코드1 */
                                          , v_Cd_Grp_Cd2  IN RTCM0050.CD_GRP_CD%TYPE        /* 코드 그룹 코드2 */
                                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT A.CD_GRP_CD    /* 코드그룹코드 */
                 , A.CD_GRP_NM    /* 코드그룹명 */
              FROM RTCM0050 A
             WHERE A.USE_YN = 'Y'
                    AND A.CD_GRP_CD IN (
                        DECODE(v_Cd_Grp_Cd1, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd1)
                      , DECODE(v_Cd_Grp_Cd2, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd2)
                     )
          ORDER BY CD_GRP_CD ASC;
    END p_sRtcm0051_RtlMasterHoBoList;
    /*******************************************************************************
     -- 렌탈 마스터 정보 검색
     *******************************************************************************/
    PROCEDURE p_sRtcm0001_RtlMasterList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                        , v_User_Nm   IN RTCM0001.USER_NM%TYPE        /* 렌탈 마스터 이름 */
                                        , v_User_Id   IN RTCM0001.USER_ID%TYPE        /* 렌탈 마스터 ID */
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
     RTCM0110 렌탈 지사 지점 검색
     *******************************************************************************/
    /*******************************************************************************
     RTCM0110 렌탈 지사 지점 검색
     *******************************************************************************/
    PROCEDURE p_sRtcm0110_RtlHOBOList(  Ref_Cursor       IN OUT SYS_REFCURSOR
                                        , v_Rnt_Ofc_Nm   IN RTCM0051.CD_NM%TYPE        /* 렌탈 마스터 이름 */
                                        , v_Rnt_Pnt_Nm   IN RTCM0051.CD_NM%TYPE        /* 렌탈 마스터 ID */
                                        , v_Ofc_Cd       IN RTCM0110.RNT_OFC%TYPE      /* 렌탈 지사 코드 */
                                        , v_Pnt_Cd       IN RTCM0110.RNT_PNT%TYPE      /* 렌탈 지점 코드 */
                                      )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT C.RNT_MST_ID                 /* 렌탈 마스터 ID */
                 , B.CD_GRP_CD AS OFC_GRP_CD    /* 그룹 렌탈 지사 코드 */
                 , A.CD_GRP_CD AS PNT_GRP_CD    /* 그룹 렌탈 지점 코드 */
                 , B.CD AS OFC_CD               /* 렌탈 지사 코드 */
                 , B.CD_NM AS OFC_NM            /* 렌탈 지사 명 */
                 , A.CD AS PNT_CD               /* 렌탈 지점 코드 */
                 , A.CD_NM AS PNT_NM            /* 렌탈 지점 명 */
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