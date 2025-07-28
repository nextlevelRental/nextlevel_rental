CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0221 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0221
   PURPOSE : 가상계좌 세부내역 관리(세틀뱅크 고정형 가상계좌)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-28  ncho             1. Created this package spec.
 *******************************************************************************/
/*****************************************************************************
 -- 가상계좌 세부내역 Select
 *****************************************************************************/
    PROCEDURE p_sRtre0221(  Ref_Cursor IN OUT SYS_REFCURSOR
                          , v_Rva_Day  IN RTRE0221.RVA_DAY%TYPE /* 요청일자 */
                          , v_Rva_Seq  IN RTRE0221.RVA_SEQ%TYPE /* 요청일련번호 */
                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A1.RVA_DAY             /* 요청일자 */
                  , A1.RVA_SEQ             /* 요청일련번호 */
                  , A1.CUST_NO             /* 고객번호 */
                  , A1.TORD_NO             /* 통합청구계약번호 */
                  , A1.ORD_NO              /* 계약번호 */
                  , A1.SCHD_SEQ            /* 청구순번 */
                  , A1.RECP_TP             /* 청구구분코드 */
                  , B1.CD_NM AS RECP_TP_NM /* 청구구분명 */
                  , A1.DEMD_DT             /* 청구일자 */
                  , A1.ZFBDT               /* 만기계산기준일 */
                  , A1.SALE_AMT            /* 매출금액 */
                  , A1.ARRE_AMT            /* 연체금액 */
                  , A1.REG_ID              /* 등록자 ID */
                  , A1.REG_DT              /* 등록일 */
                  , A1.CHG_ID              /* 변경자 ID */
                  , A1.CHG_DT              /* 변경일 */
            FROM    RTRE0221 A1 /* 가상계좌(VAN) 세부내역 */
                  , RTCM0051 B1 /* 공통코드 Detail */
            WHERE   A1.RVA_DAY      = DECODE(v_Rva_Day, NULL, A1.RVA_DAY, v_Rva_Day)
            AND     A1.RVA_SEQ      = DECODE(v_Rva_Seq, NULL, A1.RVA_SEQ, v_Rva_Seq)
            AND     A1.RECP_TP      = B1.CD(+)
            AND     B1.CD_GRP_CD(+) = 'R007'
            ORDER BY  A1.RVA_DAY
                    , A1.RVA_SEQ
                    , A1.SCHD_SEQ;
    END p_sRtre0221;
END PKG_RTRE0221;