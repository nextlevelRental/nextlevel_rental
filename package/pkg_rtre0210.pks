CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0210 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0210
    PURPOSE : 계좌즉시출금 내역조회
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-11-05  ncho             1. Created this package spec.
 *******************************************************************************/

/*******************************************************************************
 -- 계좌즉시출금 내역조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0210_accImmWthdrList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                          , v_Ract_F_Day IN RTRE0210.RACT_DAY%TYPE /* 수납일자 StartDay */
                                          , v_Ract_T_Day IN RTRE0210.RACT_DAY%TYPE /* 수납일자 EndDay */
                                          , v_Ord_No     IN RTRE0210.TORD_NO%TYPE  /* 통합청구계약번호 */
                                          , v_Cust_No    IN RTRE0210.CUST_NO%TYPE  /* 고객번호 */
                                         );

/*******************************************************************************
 -- 수납내역 상세조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0210_accImmWthdrDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                             , v_Recv_Seq IN RTRE0030.RECV_SEQ%TYPE /* 수납거래번호 */
                                            );
/*******************************************************************************
 -- 계좌수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210RactSeq
    
    RETURN NUMBER;

/*******************************************************************************
 -- 계좌주문일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210POidSeq(v_Tord_No IN RTRE0210.TORD_NO%TYPE) /* 계약번호 */
    
    RETURN NUMBER;

/*******************************************************************************
 -- 계좌즉시출금결제 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccImmWthdrMst(  v_Ract_Seq       IN  RTRE0210.RACT_SEQ%TYPE  /* 계좌수납일련번호 */
                                             , v_Tord_No        IN  RTRE0210.TORD_NO%TYPE   /* 통합청구계약번호 */
                                             , v_Cust_No        IN  RTRE0210.CUST_NO%TYPE   /* 고객번호 */
                                             , v_Recp_Amt       IN  RTRE0210.RECP_AMT%TYPE  /* 수납금액 */
                                             , v_Recp_Tp        IN  RTRE0210.RECP_TP%TYPE   /* 청구구분 */
                                             , v_Recp_Pay       IN  RTRE0210.RECP_PAY%TYPE  /* 수납방법 */
                                             , v_Recp_Fg        IN  RTRE0210.RECP_FG%TYPE   /* 수납유형 */
                                             , v_Tno            IN  RTRE0210.TNO%TYPE       /* 거래번호 */
                                             , v_Recv_Seq       IN  RTRE0210.RECV_SEQ%TYPE  /* 계좌수납거래번호 */
                                             , v_Cnc_Stat       IN  RTRE0210.CNC_STAT%TYPE  /* 수납취소여부 */
                                             , v_P_Oid_Seq      IN  RTRE0210.P_OID_SEQ%TYPE /* 주문일련번호 */
                                             , v_Reg_Id         IN  RTRE0210.REG_ID%TYPE    /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- 계좌즉시출금결제 상세 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0211AccImmWthdrDtl(  v_Ract_Seq       IN  RTRE0211.RACT_SEQ%TYPE /* 계좌수납일련번호 */
                                             , v_Cust_No        IN  RTRE0211.CUST_NO%TYPE  /* 고객번호 */
                                             , v_Tord_No        IN  RTRE0211.TORD_NO%TYPE  /* 통합청구계약번호 */
                                             , v_Ord_No         IN  RTRE0211.ORD_NO%TYPE   /* 계약번호 */
                                             , v_Schd_Seq       IN  RTRE0211.SCHD_SEQ%TYPE /* 청구순번 */
                                             , v_Recp_Tp        IN  RTRE0211.RECP_TP%TYPE  /* 청구구분 */
                                             , v_Zfbdt          IN  RTRE0211.ZFBDT%TYPE    /* 청구일자 */
                                             , v_Sale_Amt       IN  RTRE0211.SALE_AMT%TYPE /* 청구금액 */
                                             , v_Arre_Amt       IN  RTRE0211.ARRE_AMT%TYPE /* 미납금액 */
                                             , v_Reg_Id         IN  RTRE0211.REG_ID%TYPE   /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- 계좌즉시출금결제 계좌정보 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0212AccImmWthdrAcc(  v_Tno            IN  RTRE0212.TNO%TYPE        /* 거래번호 */
                                             , v_Sec_Bnk_No     IN  RTRE0212.BNK_NO%TYPE /* 계좌번호 */
                                             , v_Bnk_Cd         IN  RTRE0212.BNK_CD%TYPE     /* 은행코드 */
                                             , v_Cust_Nm        IN  RTRE0212.CUST_NM%TYPE    /* 예금주명 */
                                             , v_Reg_Id         IN  RTRE0212.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*****************************************************************************
 -- 계좌즉시출금 수납처리 결과 저장
 *****************************************************************************/
    FUNCTION f_UpdateRTRE0210RecvResult(  v_RACT_Day  IN  RTRE0210.RACT_DAY%TYPE /* 요청일자 */
                                        , v_RACT_Seq  IN  RTRE0210.RACT_SEQ%TYPE /* 요청일련번호 */
                                        , v_Recv_Seq  IN  RTRE0210.RECV_SEQ%TYPE /* 수납거래번호 */
                                        , v_Reg_Id    IN  RTRE0210.REG_ID%TYPE   /* 등록자 ID */
                                        , v_ErrorText OUT VARCHAR2
                                       )
    RETURN NUMBER;

/*****************************************************************************
 -- 계좌즉시출금 수납처리
 *****************************************************************************/
    PROCEDURE p_CreateRTRE0210RactReceive(  v_Tno            IN  RTRE0210.TNO%TYPE    /* 거래고유번호 */
                                          , v_Reg_Id         IN  RTRE0210.REG_ID%TYPE /* 등록자ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         );

/*******************************************************************************
  -- 계좌즉시출금결제이력 수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210HstReqSeq(  v_Ord_Cd  IN RTRE0215.ORD_CD%TYPE  /* 계약번호 */
                                  , v_Cust_No IN RTRE0215.CUST_NO%TYPE /* 거래번호 */
                                 )
    
    RETURN NUMBER;

/*****************************************************************************
 -- 계좌즉시출금 결제취소 내역 Update(환불이 아닌 수납취소만)
 *****************************************************************************/
    FUNCTION f_UpdateRtre0210Cancle(  v_Recv_Seq  IN  RTRE0210.RECV_SEQ%TYPE /* 수납거래번호 */
                                    , v_Cnc_Rseq  IN  RTRE0210.CNC_RSEQ%TYPE /* 수납취소거래번호 */
                                    , v_Cnc_Stat  IN  RTRE0210.CNC_STAT%TYPE /* 수납취소여부 */
                                    , v_Reg_Id    IN  RTRE0210.REG_ID%TYPE   /* 등록자 ID */
                                    , v_ErrorText OUT VARCHAR2
                                   )
    RETURN NUMBER;

/*******************************************************************************
 -- 계좌즉시출금취소 저장 Update
 *******************************************************************************/
    PROCEDURE p_UpdateRtre0210AccCancel(  v_Ract_Day         IN  RTRE0210.RACT_DAY%TYPE         /* 카드수납일자 */
                                        , v_Recv_Seq         IN  RTRE0210.RECV_SEQ%TYPE         /* 수납거래번호 */
                                        , v_Cnc_Rseq         IN  RTRE0210.CNC_RSEQ%TYPE         /* 수납취소거래번호 */
                                        , v_Cnc_Tno          IN  RTRE0210.CNC_TNO%TYPE          /* 세틀뱅크취소거래번호 */
                                        , v_Prt_Cnc_Rmnn_Amt IN  RTRE0210.PRT_CNC_RMNN_AMT%TYPE /* 수납취소후남은금액 */
                                        , v_Refund_Yn        IN  RTRE0210.REFUND_YN%TYPE        /* 환불여부 */
                                        , v_Chg_Id           IN  RTRE0210.CHG_ID%TYPE           /* 변경자 ID */
                                        , v_Success_Code     OUT NUMBER
                                        , v_Return_Message   OUT VARCHAR2
                                        , v_Error_Text       OUT VARCHAR2
                                       );

/*******************************************************************************
 -- 계좌즉시출금결제이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccImmWthdrHst(  v_Req_Seq	 	    IN  RTRE0215.REQ_SEQ%TYPE   /* 요청순번 */
                                             , v_Cust_No        IN  RTRE0215.CUST_NO%TYPE   /* 고객번호 */
                                             , v_Ord_Cd         IN  RTRE0215.ORD_CD%TYPE    /* 계약번호 */
                                             , v_Work_Gb        IN  RTRE0215.WORK_GB%TYPE   /* 요청업무 */
                                             , v_Method         IN  RTRE0215.METHOD%TYPE    /* 메소드명 */
                                             , v_Pay_Gb         IN  RTRE0215.PAY_GB%TYPE    /* 업무구분 */
                                             , v_P_Mid          IN  RTRE0215.P_MID%TYPE     /* 상점아이디 */
                                             , v_P_Oid          IN  RTRE0215.P_OID%TYPE     /* 주문번호 */
                                             , v_P_Tr_Dt        IN  RTRE0215.P_TR_DT%TYPE   /* 거래일자 */
                                             , v_P_Tr_Time      IN  RTRE0215.P_TR_TIME%TYPE /* 거래시간 */
                                             , v_P_Acc_No       IN  RTRE0215.P_ACC_NO%TYPE  /* 계좌번호 */
                                             , v_P_Bank_Cd      IN  RTRE0215.P_BANK_CD%TYPE /* 은행코드 */
                                             , v_P_Cust_Id      IN  RTRE0215.P_CUST_ID%TYPE /* 고객ID */
                                             , v_P_Cust_Nm      IN  RTRE0215.P_CUST_NM%TYPE /* 예금주명 */
                                             , v_P_Uname        IN  RTRE0215.P_UNAME%TYPE   /* 결제고객성명 */
                                             , v_P_Goods        IN  RTRE0215.P_GOODS%TYPE   /* 결제상품명 */
                                             , v_P_Amt          IN  RTRE0215.P_AMT%TYPE     /* 거래금액 */
                                             , v_P_Rm           IN  RTRE0215.P_RM%TYPE      /* 생년월일 */
                                             , v_P_Bname        IN  RTRE0215.P_BNAME%TYPE   /* 통장인자명 */
                                             , v_P_Hash         IN  RTRE0215.P_HASH%TYPE    /* Hash데이터 */
                                             , v_P_Tr_No        IN  RTRE0215.P_TR_NO%TYPE   /* 거래번호 */
                                             , v_P_Satus        IN  RTRE0215.P_SATUS%TYPE   /* 거래상태 */
                                             , v_P_Err_Cd       IN  RTRE0215.P_ERR_CD%TYPE  /* 거절코드 */
                                             , v_PRmesg         IN  RTRE0215.P_RMESG%TYPE   /* 메시지 */
                                             , v_Reg_Id         IN  RTRE0215.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
  -- 거래취소번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210HstCncSeq(v_Tno IN RTRE0216.TNO%TYPE) /* 거래번호 */

    RETURN NUMBER;

/*******************************************************************************
  -- 계좌즉시출금취소이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccCancelHst(  v_Tno            IN  RTRE0216.TNO%TYPE      /* 거래번호 */
                                           , v_Cnc_Seq        IN  RTRE0216.CNC_SEQ%TYPE  /* 거래취소번호 */
                                           , v_Mod_Type       IN  RTRE0216.MOD_TYPE%TYPE /* 요청종류 */
                                           , v_Mod_Mny        IN  RTRE0216.MOD_MNY%TYPE  /* 취소요청금액 */
                                           , v_Rem_Mny        IN  RTRE0216.REM_MNY%TYPE  /* 취소가능금액 */
                                           , v_Mod_Desc       IN  RTRE0216.MOD_DESC%TYPE /* 취소사유 */
                                           , v_Res_Cd         IN  RTRE0216.RES_CD%TYPE   /* 결과코드 */
                                           , v_Res_Msg        IN  RTRE0216.RES_MSG%TYPE  /* 결과내용 */
                                           , v_Reg_Id         IN  RTRE0216.REG_ID%TYPE   /* 등록자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          );
END Pkg_Rtre0210;