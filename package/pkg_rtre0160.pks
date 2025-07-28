CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0160 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0160
    PURPOSE : 선납내역 저장
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-11  ncho             1. Created this package body.
 *******************************************************************************/

/*****************************************************************************
 -- 선납개월 선택항목 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrptMonList(Ref_Cursor IN OUT SYS_REFCURSOR);

/*****************************************************************************
 -- 선납금액계산
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntAmtCalc(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                         , v_Dc_Cd    IN RTSD0025.DC_CD%TYPE   /* 할인코드 */
                                         , v_Prpt_Mon IN RTSD0025.MAX_CNT%TYPE /* 선납개월 */
                                        );

/*****************************************************************************
 -- 납부예정상세 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PymntSchdlDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                           , v_Dc_Cd    IN RTSD0025.DC_CD%TYPE   /* 할인코드 */
                                           , v_Prpt_Mon IN RTSD0025.MAX_CNT%TYPE /* 선납개월 */
                                          );

/*******************************************************************************
 -- 선납요청일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0160PrptSeq

    RETURN NUMBER;

/*******************************************************************************
 -- 선납내역 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0160PrePymntMst(  v_Prpt_Seq       IN  RTRE0160.PRPT_SEQ%TYPE       /* 선납요청일련번호 */
                                          , v_Ord_No         IN  RTRE0160.ORD_NO%TYPE         /* 계약번호 */
                                          , v_Cust_No        IN  RTRE0160.CUST_NO%TYPE        /* 고객번호 */
                                          , v_Recp_Fg        IN  RTRE0160.RECP_FG%TYPE        /* 수납유형 */
                                          , v_Recp_Pay       IN  RTRE0160.RECP_PAY%TYPE       /* 수납방법 */
                                          , v_Recv_Seq       IN  RTRE0160.RECV_SEQ%TYPE       /* 수납거래번호 */
                                          , v_Recp_Trno      IN  RTRE0160.RECP_TRNO%TYPE      /* 납부별수납고유번호 */
                                          , v_Prpt_Mnct      IN  RTRE0160.PRPT_MNCT%TYPE      /* 선납개월 */
                                          , v_Prpt_Dscn_Rt   IN  RTRE0160.PRPT_DSCN_RT%TYPE   /* 선납할인율 */
                                          , v_Tot_Rnt_Amt    IN  RTRE0160.TOT_RNT_AMT%TYPE    /* 총렌탈금액 */
                                          , v_Tot_Prpt_Dcamt IN  RTRE0160.TOT_PRPT_DCAMT%TYPE /* 총할인금액 */
                                          , v_Tot_Prpt_Amt   IN  RTRE0160.TOT_PRPT_AMT%TYPE   /* 납입예정금액 */
                                          , v_Prpt_Blnc_Amt  IN  RTRE0160.PRPT_BLNC_AMT%TYPE  /* 미납금액 */
                                          , v_Prpt_Sttg_Tmbt IN  RTRE0160.PRPT_STTG_TMBT%TYPE /* 선납시작회차 */
                                          , v_Prpt_Fnsh_Tmbt IN  RTRE0160.PRPT_FNSH_TMBT%TYPE /* 선납종료회차 */
                                          , v_Recv_Day       IN  RTRE0160.RECV_DAY%TYPE       /* 선납수납일자 */
                                          , v_Reg_Id         IN  RTRE0160.REG_ID%TYPE         /* 등록자 ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_Error_Text     OUT VARCHAR2
                                         );

/*******************************************************************************
 -- 선납내역 상세 Insert
 *******************************************************************************/
   PROCEDURE p_InsertRtre0161PrePymntDtl(  v_Prpt_Seq       IN  RTRE0161.PRPT_SEQ%TYPE       /* 선납요청일련번호 */
                                         , v_Ord_No         IN  RTRE0161.ORD_NO%TYPE         /* 계약번호 */
                                         , v_Schd_Seq_I     IN  RTRE0161.SCHD_SEQ%TYPE       /* 스케쥴순번 Insert */
                                         , v_Sale_Amt       IN  RTRE0161.SALE_AMT%TYPE       /* 월정기금액 */
                                         , v_Prpt_Seq_Dcamt IN  RTRE0161.PRPT_SEQ_DCAMT%TYPE /* 선납할인금액(회차별 위약금) */
                                         , v_Reg_Id         IN  RTRE0161.REG_ID%TYPE         /* 등록자 ID */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_Error_Text     OUT VARCHAR2
                                        );

/*****************************************************************************
 -- 선납할인수납 청구스케줄 Update
 *****************************************************************************/
    FUNCTION f_UpdateRtsd0109PrePymnt(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE   /* 계약번호 */
                                      , v_Schd_Seq  IN  RTSD0109.SCHD_SEQ%TYPE /* 스케쥴순번 */
                                      , v_Sale_Amt  IN  RTSD0109.SALE_AMT%TYPE /* 월정기금액 */
                                      , v_Arre_Amt  IN  RTSD0109.ARRE_AMT%TYPE /* 미납금액 */
                                      , v_Chg_Id    IN  RTSD0109.CHG_ID%TYPE   /* 변경자 ID */
                                      , v_ErrorText OUT VARCHAR2
                                     )
    RETURN NUMBER;



/*****************************************************************************
 -- 선납할인여부
 *****************************************************************************/
    FUNCTION f_Rtsd0105PrePymnt(v_Ord_No    IN  RTSD0109.ORD_NO%TYPE) /* 계약번호 */

    RETURN VARCHAR2;
    
/*****************************************************************************
 -- 선납할인가능여부 체크
 *****************************************************************************/
    FUNCTION f_Rtsd0160PrePymntChk(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                   , v_Dc_Cd     IN  RTSD0025.DC_CD%TYPE /* 선납할인코드 */

                                )
     RETURN VARCHAR2;        

/*****************************************************************************
 -- 선납내역조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePaymentMstList(  Ref_Cursor      IN OUT SYS_REFCURSOR
                                           , v_Prpt_From_Day IN RTRE0160.PRPT_DAY%TYPE /* 요청일자(From) */
                                           , v_Prpt_To_Day   IN RTRE0160.PRPT_DAY%TYPE /* 요청일자(To) */
                                           , v_Recv_From_Day IN RTRE0160.RECV_DAY%TYPE /* 수납일자(From) */
                                           , v_Recv_To_Day   IN RTRE0160.RECV_DAY%TYPE /* 수납일자(To) */
                                           , v_Ord_No        IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                           , v_Cust_No       IN RTRE0160.CUST_NO%TYPE  /* 고객번호 */
                                          );

/*****************************************************************************
 -- 선납내역상세조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePaymentDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTRE0160.ORD_NO%TYPE /* 계약번호 */
                                          );

/*****************************************************************************
 -- 선납할인금액계산
 *****************************************************************************/
    PROCEDURE p_sRtre0160prePymntDscntCalc(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                           , v_Zfb_Day  IN RTRE0160.PRPT_DAY%TYPE /* 취소일자 */
                                          );

/*****************************************************************************
 -- 선납 Update Data 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntUpdateList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                            , v_Ord_No     IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Prpt_Seq   IN RTRE0160.PRPT_SEQ%TYPE /* 선납순번 */
                                            , v_Schd_Seq_U IN RTRE0161.SCHD_SEQ%TYPE /* 청구순번 Update */
                                            , v_Schd_Seq_I IN RTRE0161.SCHD_SEQ%TYPE /* 청구순번 Insert */
                                           );

/*****************************************************************************
 -- 선납 취소 Update Data 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntCancelList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                            , v_Ord_No   IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Prpt_Seq IN RTRE0160.PRPT_SEQ%TYPE /* 선납순번 */
                                           );

/*****************************************************************************
 -- 선납취소매출 Update
 *****************************************************************************/
    PROCEDURE p_UpdateRtre0160CancelPrpt(  v_Ord_No         IN  RTRE0160.ORD_NO%TYPE        /* 계약번호 */
                                         , v_Prpt_Seq       IN  RTRE0160.PRPT_SEQ%TYPE      /* 요청일련번호 */
                                         , v_Cnc_Rseq       IN  RTRE0160.PRPT_CNC_RSEQ%TYPE /* 선납취소거래번호 */
                                         , v_Reg_Id         IN  RTRE0160.REG_ID%TYPE        /* 등록자 ID */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_ErrorText      OUT VARCHAR2
                                        );

/*****************************************************************************
 -- 가상계좌 선납할인수납 수납번호 Update
 *****************************************************************************/
    FUNCTION f_UpdateRtre0160PrePymnt(  v_Ord_No    IN  RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                      , v_Recv_Seq  IN  RTRE0160.RECV_SEQ%TYPE /* 수납번호 */
                                      , v_Recp_Trno IN  RTRE0160.RECP_TRNO%TYPE /* 수납거래번호 */
                                      , v_Recv_Day  IN  RTRE0160.RECV_DAY%TYPE /* 수납일 */
                                      , v_Prpt_Day  IN  RTRE0160.PRPT_DAY%TYPE /* 선납등록일 */
                                      , v_Recp_Pay  IN  RTRE0160.RECP_PAY%TYPE /* 납부방법 */
                                      , v_Chg_Id    IN  RTRE0160.CHG_ID%TYPE   /* 변경자 ID */
                                      , v_ErrorText OUT VARCHAR2
                                     )
    RETURN NUMBER;

END Pkg_Rtre0160;