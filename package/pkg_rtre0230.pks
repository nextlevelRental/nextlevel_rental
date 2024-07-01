CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0230 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0230
    PURPOSE : 중도완납/해지 내역조회
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-07  sunq             1. Created this package spec.
 *******************************************************************************/

/*******************************************************************************
 -- 중도완납/해지 내역조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0230_fullPayRehisList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Cnc_F_Day  IN RTRE0230.CNC_DAY%TYPE    /* 취소일자 StartDay */
                                           , v_Cnc_T_Day  IN RTRE0230.CNC_DAY%TYPE    /* 취소일자 EndDay */
                                           , v_Ord_No     IN RTRE0230.ORD_NO%TYPE     /* 계약번호 */
                                           , v_Cust_No    IN RTRE0230.CUST_NO%TYPE    /* 고객번호 */
                                           , v_Mfp_Cd     IN RTRE0230.MFP_CD%TYPE     /* 구분 */
                                           , v_Mfp_Rsn_Cd IN RTRE0230.MFP_RSN_CD%TYPE /* 완납/해지사유 */
                                          );

/*******************************************************************************
 -- 중도완납순번 채번
 *******************************************************************************/
    FUNCTION f_sRtre0230MfpSeq
    RETURN NUMBER;

/*******************************************************************************
 -- 중도완납내역 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtsd0230MidFullPymnt(  v_Mfp_Seq        IN  RTRE0230.MFP_SEQ%TYPE      /* 중도완납순번 */
                                           , v_Ord_No         IN  RTRE0230.ORD_NO%TYPE       /* 고객번호 */
                                           , v_Cust_No        IN  RTRE0230.CUST_NO%TYPE      /* 고객번호 */
                                           , v_Cnc_Day        IN  RTRE0230.CNC_DAY%TYPE      /* 취소일자 */
                                           , v_Recv_Mon       IN  RTRE0230.RECV_MON%TYPE     /* 수납년월 */
                                           , v_Mfp_Cd         IN  RTRE0230.MFP_CD%TYPE       /* 해지구분 */
                                           , v_Proc_Day       IN  RTRE0230.PROC_DAY%TYPE     /* 장착일자 */
                                           , v_Tot_Rent_Amt   IN  RTRE0230.TOT_RENT_AMT%TYPE /* 총렌탈료 */
                                           , v_Recv_Amt       IN  RTRE0230.RECV_AMT%TYPE     /* 수납금액 */
                                           , v_Pnlt_Amt       IN  RTRE0230.PNLT_AMT%TYPE     /* 위약금 */
                                           , v_Serv_Amt       IN  RTRE0230.SERV_AMT%TYPE     /* 추가납부금액 */
                                           , v_Tot_Recv_Amt   IN  RTRE0230.TOT_RECV_AMT%TYPE /* 총수납금액 */
                                           , v_Recv_Rt        IN  RTRE0230.RECV_RT%TYPE      /* 회수율 */
                                           , v_Recp_Pay       IN  RTRE0230.RECP_PAY%TYPE     /* 수납방법 */
                                           , v_Recv_Seq       IN  RTRE0230.RECV_SEQ%TYPE     /* 수납거래번호 */
                                           , v_Mfp_Rsn_Cd     IN  RTRE0230.MFP_RSN_CD%TYPE   /* 완납해지사유코드 */
                                           , v_Mfp_Desc       IN  RTRE0230.MFP_DESC%TYPE     /* 완납해지상세사유 */
                                           , v_Reg_Id         IN  RTRE0230.REG_ID%TYPE       /* 등록자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          );

/*******************************************************************************
 -- 선수금관련 Seq 조회
 *******************************************************************************/
    PROCEDURE p_sRtre0035SeqList(  Ref_Cursor       IN OUT SYS_REFCURSOR
                                 , v_Ord_No         IN  RTRE0035.ORD_NO%TYPE  /* 계약번호 */
                                );

/*******************************************************************************
 -- 중도완납환불대상내역조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0230MfpRfndTrgtList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Recv_Mon IN RTRE0230.RECV_MON%TYPE /* 대상년월 */
                                         , v_Mfp_Cd   IN RTRE0230.MFP_CD%TYPE   /* 계약종료유형 */
                                        );

END Pkg_Rtre0230;
/
