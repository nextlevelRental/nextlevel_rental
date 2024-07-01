CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0221 AS
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
                         );

END PKG_RTRE0221;
/
