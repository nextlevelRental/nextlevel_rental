CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0110SEC AS
/*******************************************************************************
    NAME    : Pkg_Rtcm0110
    PURPOSE : 렌탈마스터 권한 설정
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-14  sunq             1. Created this package spec.
 *******************************************************************************/
   /*******************************************************************************
     -- 사용자 RTCM0001에서 렌탈마스터 조회 COMBOBOX 사용 
    *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterCBList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                          , v_Cd_Grp_Cd IN RTCM0051.CD_GRP_CD%TYPE        /* 코드 그룹 코드 */
                                          , v_Cd_Nm     IN RTCM0051.CD_NM%TYPE            /* 코드명 */
                                         );
   /*******************************************************************************
    -- 사용자 RTCM0050에서 렌탈 지사 / 지점 조회 COMBOBOX 사용
    *******************************************************************************/
    PROCEDURE p_sRtcm0051_RtlMasterHoBoList(  Ref_Cursor    IN OUT SYS_REFCURSOR
                                            , v_Cd_Grp_Cd1  IN RTCM0050.CD_GRP_CD%TYPE        /* 코드 그룹 코드1 */
                                            , v_Cd_Grp_Cd2  IN RTCM0050.CD_GRP_CD%TYPE        /* 코드 그룹 코드2 */
                                           );
   /*******************************************************************************
    -- 렌탈 마스터 정보 검색
    *******************************************************************************/
    PROCEDURE p_sRtcm0001_RtlMasterList(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                        , v_User_Nm   IN RTCM0001.USER_NM%TYPE        /* 렌탈 마스터 이름 */
                                        , v_User_Id   IN RTCM0001.USER_ID%TYPE        /* 렌탈 마스터 ID */
                                      );
   /*******************************************************************************
    -- RTCM0110 렌탈 지사 지점 검색
    *******************************************************************************/
    PROCEDURE p_sRtcm0110_RtlHOBOList(  Ref_Cursor     IN OUT SYS_REFCURSOR
                                      , v_Rnt_Ofc_Nm   IN RTCM0051.CD_NM%TYPE        /* 렌탈 지사명 */
                                      , v_Rnt_Pnt_Nm   IN RTCM0051.CD_NM%TYPE        /* 렌탈 지점명 */
                                      , v_Ofc_Cd       IN RTCM0110.RNT_OFC%TYPE      /* 렌탈 지사 코드 */
                                      , v_Pnt_Cd       IN RTCM0110.RNT_PNT%TYPE      /* 렌탈 지점 코드 */
                                    );
END Pkg_Rtcm0110SEC;