CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0200 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0200
   PURPOSE : 카드즉시출금 내역조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-06  ncho             1. Created this package spec.
 *******************************************************************************/

/*******************************************************************************
 -- 카드즉시출금 내역조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0200_crdImmWthdrList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                          , v_Rcrd_F_Day IN RTRE0200.RCRD_DAY%TYPE /* 수납일자 StartDay */
                                          , v_Rcrd_T_Day IN RTRE0200.RCRD_DAY%TYPE /* 수납일자 EndDay */
                                          , v_Ord_No     IN RTRE0200.TORD_NO%TYPE  /* 통합청구계약번호 */
                                          , v_Cust_No    IN RTRE0200.CUST_NO%TYPE  /* 고객번호 */
                                         );

/*******************************************************************************
 -- 수납내역 상세조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0200_crdImmWthdrDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                             , v_Recv_Seq IN RTRE0030.RECV_SEQ%TYPE /* 수납거래번호 */
                                            );

/*******************************************************************************
 -- 카드수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0200RcrdSeq

    RETURN NUMBER;

/*******************************************************************************
 -- 카드즉시출금결제 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdImmWthdrMst(  v_Rcrd_Seq       IN  RTRE0200.RCRD_SEQ%TYPE /* 카드수납일련번호 */
                                             , v_Tord_No        IN  RTRE0200.TORD_NO%TYPE  /* 통합청구계약번호 */
                                             , v_Cust_No        IN  RTRE0200.CUST_NO%TYPE  /* 고객번호 */
                                             , v_Recp_Amt       IN  RTRE0200.RECP_AMT%TYPE /* 수납금액 */
                                             , v_Recp_Tp        IN  RTRE0200.RECP_TP%TYPE  /* 청구구분 */
                                             , v_Recp_Pay       IN  RTRE0200.RECP_PAY%TYPE /* 수납방법 */
                                             , v_Recp_Fg        IN  RTRE0200.RECP_FG%TYPE  /* 수납유형 */
                                             , v_Tno            IN  RTRE0200.TNO%TYPE      /* 거래번호 */
                                             , v_App_No         IN  RTRE0200.APP_NO%TYPE   /* 승인번호 */
                                             , v_Recv_Seq       IN  RTRE0200.RECV_SEQ%TYPE /* 카드수납거래번호 */
                                             , v_Cnc_Stat       IN  RTRE0200.CNC_STAT%TYPE /* 수납취소여부 */
                                             , v_Reg_Id         IN  RTRE0200.REG_ID%TYPE   /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- 카드즉시출금결제 상세 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0201CrdImmWthdrDtl(  v_Rcrd_Seq       IN  RTRE0201.RCRD_SEQ%TYPE /* 카드수납일련번호 */
                                             , v_Cust_No        IN  RTRE0201.CUST_NO%TYPE  /* 고객번호 */
                                             , v_Tord_No        IN  RTRE0201.TORD_NO%TYPE  /* 통합청구계약번호 */
                                             , v_Ord_No         IN  RTRE0201.ORD_NO%TYPE   /* 계약번호 */
                                             , v_Schd_Seq       IN  RTRE0201.SCHD_SEQ%TYPE /* 청구순번 */
                                             , v_Recp_Tp        IN  RTRE0201.RECP_TP%TYPE  /* 청구구분 */
                                             , v_Zfbdt          IN  RTRE0201.ZFBDT%TYPE    /* 청구일자 */
                                             , v_Sale_Amt       IN  RTRE0201.SALE_AMT%TYPE /* 청구금액 */
                                             , v_Arre_Amt       IN  RTRE0201.ARRE_AMT%TYPE /* 미납금액 */
                                             , v_Reg_Id         IN  RTRE0201.REG_ID%TYPE   /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*******************************************************************************
 -- 카드즉시출금결제 카드정보 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0202CrdImmWthdrCrd(  v_Tno            IN  RTRE0202.TNO%TYPE        /* 거래번호 */
                                             , v_Sec_Crd_No         IN  RTRE0202.CRD_NO%TYPE /* 카드번호 */
                                             , v_Crd_Cd         IN  RTRE0202.CRD_CD%TYPE     /* 카드사코드 */
                                             , v_Reg_Id         IN  RTRE0202.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*****************************************************************************
 -- 카드즉시 입금 수납처리 결과 저장
 *****************************************************************************/
    FUNCTION f_UpdateRtre0200RecvResult(  v_Rcrd_Day  IN  RTRE0200.RCRD_DAY%TYPE /* 요청일자 */
                                        , v_Rcrd_Seq  IN  RTRE0200.RCRD_SEQ%TYPE /* 요청일련번호 */
                                        , v_Recv_Seq  IN  RTRE0200.RECV_SEQ%TYPE /* 수납거래번호 */
                                        , v_Reg_Id    IN  RTRE0200.REG_ID%TYPE   /* 등록자 ID */
                                        , v_ErrorText OUT VARCHAR2
                                       )
    RETURN NUMBER;

/*****************************************************************************
 -- 카드즉시 수납처리
 *****************************************************************************/
    PROCEDURE p_CreateRtre0200RcrdReceive(  v_Tno            IN  RTRE0200.TNO%TYPE    /* 거래고유번호 */
                                          , v_Reg_Id         IN  RTRE0200.REG_ID%TYPE /* 등록자ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         );

/*******************************************************************************
  -- 카드즉시출금결제이력 수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0200HstRcrdSeq

    RETURN NUMBER;

/*******************************************************************************
  -- 카드즉시출금결제이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdImmWthdrHst(  v_Rcrd_Seq       IN  RTRE0205.RCRD_SEQ%TYPE   /* 수납일련번호 */
                                             , v_Tord_No        IN  RTRE0205.TORD_NO%TYPE    /* 통합청구계약번호 */
                                             , v_Cust_No        IN  RTRE0205.CUST_NO%TYPE    /* 고객번호 */
                                             , v_Recp_Amt       IN  RTRE0205.RECP_AMT%TYPE   /* 수납금액 */
                                             , v_Email          IN  RTRE0205.EMAIL%TYPE      /* 주문자 E-Mail */
                                             , v_Tno            IN  RTRE0205.TNO%TYPE        /* 거래번호 */
                                             , v_Sec_Crd_No         IN  RTRE0205.CRD_NO%TYPE /* 카드번호 */
                                             , v_Crd_Cd         IN  RTRE0205.CRD_CD%TYPE     /* 카드사코드 */
                                             , v_Crd_Nm         IN  RTRE0205.CRD_NM%TYPE     /* 카드사명 */
                                             , v_App_Time       IN  RTRE0205.APP_TIME%TYPE   /* 결제승인시간 */
                                             , v_App_No         IN  RTRE0205.APP_NO%TYPE     /* 승인번호 */
                                             , v_Noinf          IN  RTRE0205.NOINF%TYPE      /* 무이자할부여부 */
                                             , v_Noinf_Type     IN  RTRE0205.NOINF_TYPE%TYPE /* 무이자할부 이벤트 구분 */
                                             , v_Quota          IN  RTRE0205.QUOTA%TYPE      /* 할부개월 */
                                             , v_Res_Cd         IN  RTRE0205.RES_CD%TYPE     /* 결과코드 */
                                             , v_Res_Msg        IN  RTRE0205.RES_MSG%TYPE    /* 결과내용 */
                                             , v_Reg_Id         IN  RTRE0205.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            );

/*****************************************************************************
 -- 카드즉시출금 결제취소 내역 Update(환불이 아닌 수납취소만)
 *****************************************************************************/
    FUNCTION f_UpdateRtre0200Cancle(  v_Recv_Seq  IN  RTRE0200.RECV_SEQ%TYPE /* 수납거래번호 */
                                    , v_Cnc_Rseq  IN  RTRE0200.CNC_RSEQ%TYPE /* 수납취소거래번호 */
                                    , v_Cnc_Stat  IN  RTRE0200.CNC_STAT%TYPE /* 수납취소여부 */
                                    , v_Reg_Id    IN  RTRE0200.REG_ID%TYPE   /* 등록자 ID */
                                    , v_ErrorText OUT VARCHAR2
                                   )
    RETURN NUMBER;

/*******************************************************************************
 -- 카드즉시출금취소 저장 Update
 *******************************************************************************/
    PROCEDURE p_UpdateRtre0200CrdCancel(  v_Rcrd_Day         IN  RTRE0200.RCRD_DAY%TYPE         /* 카드수납일자 */
                                        , v_Recv_Seq         IN  RTRE0200.RECV_SEQ%TYPE         /* 수납거래번호 */
                                        , v_Cnc_Rseq         IN  RTRE0200.CNC_RSEQ%TYPE         /* 수납취소거래번호 */
                                        , v_Cnc_Tno          IN  RTRE0200.CNC_TNO%TYPE          /* KCP취소거래번호 */
                                        , v_Prt_Cnc_Rmnn_Amt IN  RTRE0200.PRT_CNC_RMNN_AMT%TYPE /* 수납취소후남은금액 */
                                        , v_Refund_Yn        IN  RTRE0200.REFUND_YN%TYPE        /* 환불여부 */
                                        , v_Chg_Id           IN  RTRE0200.CHG_ID%TYPE           /* 등록자 ID */
                                        , v_Success_Code     OUT NUMBER
                                        , v_Return_Message   OUT VARCHAR2
                                        , v_Error_Text       OUT VARCHAR2
                                       );

/*******************************************************************************
  -- 카드즉시출금취소이력 거래취소번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0200HstCncSeq(v_Tno IN RTRE0206.TNO%TYPE) /* 거래번호 */

    RETURN NUMBER;

/*******************************************************************************
  -- 카드즉시출금취소이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdCancelHst(  v_Tno            IN  RTRE0206.TNO%TYPE      /* 거래번호 */
                                           , v_Cnc_Seq        IN  RTRE0206.CNC_SEQ%TYPE  /* 거래취소번호 */
                                           , v_Mod_Type       IN  RTRE0206.MOD_TYPE%TYPE /* 요청종류 */
                                           , v_Mod_Mny        IN  RTRE0206.MOD_MNY%TYPE  /* 취소요청금액 */
                                           , v_Rem_Mny        IN  RTRE0206.REM_MNY%TYPE  /* 취소가능금액 */
                                           , v_Mod_Desc       IN  RTRE0206.MOD_DESC%TYPE /* 취소사유 */
                                           , v_Res_Cd         IN  RTRE0206.RES_CD%TYPE   /* 결과코드 */
                                           , v_Res_Msg        IN  RTRE0206.RES_MSG%TYPE  /* 결과내용 */
                                           , v_Reg_Id         IN  RTRE0206.REG_ID%TYPE   /* 등록자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          );
                                          
/*****************************************************************************
 -- 카드즉시출금 수납처리 메니져
 --
 *****************************************************************************/
    PROCEDURE p_InsertRtre0200TotCrdRecvMng(  v_Recv_Day       IN  VARCHAR2     /*수납일자  */
                                            , v_Ord_No         IN  VARCHAR2       /* 계약번호 */
                                            , v_Cust_No        IN  VARCHAR2      /* 고객번호 */
                                            , v_Recp_Amt       IN  VARCHAR2     /* 수납금액 */
                                            , v_Tno            IN  VARCHAR2          /* 거래고유번호 */
                                            , v_App_No         IN  VARCHAR2       /* 승인번호 */
                                            , v_Dc_Cd          IN  VARCHAR2        /* 할인코드 */
                                            , v_Prpt_Mon       IN  VARCHAR2      /* 선납개월 */
                                            , v_Cnc_Day        IN  VARCHAR2      /* 취소일자 */
                                            , v_Serv_Amt       IN  VARCHAR2     /* 추가납부금액 */
                                            , v_Mfp_Cd         IN  VARCHAR2       /* 해지구분 */
                                            , v_Mfp_Rsn_Cd     IN  VARCHAR2        /* 완납해지사유코드 */
                                            , v_Mfp_Desc       IN  VARCHAR2          /* 완납해지상세사유 */
                                            , v_Work_Cd        IN  VARCHAR2                   /* 수납업무 구분 */
                                            , v_Reg_Id         IN  VARCHAR2 /* 등록자 ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_ErrorText      OUT VARCHAR2
                                             );
                                             
/*****************************************************************************
 -- 카드즉시출금 환불처리 메니져
 --
 *****************************************************************************/
    PROCEDURE p_Rtre0200TotCrdRecvRfndMng(  v_Recv_Day       IN  VARCHAR2      /*수납일자  */
                                          , v_Ord_No         IN  VARCHAR2       /* 계약번호 */
                                          , v_Cust_No        IN  VARCHAR2      /* 고객번호 */
                                          , v_Panc_Remn_Amt  IN  VARCHAR2      /* 환불후남은금액 */
                                          , v_Recv_Seq       IN  VARCHAR2     /* 수납거래번호 */
                                          , v_Prpt_Seq       IN  VARCHAR2       /* 선납순번 */
                                          , v_Work_Cd        IN  VARCHAR2
                                          , v_Tno            IN  VARCHAR2    /* 거래고유번호 */
                                          , v_Reg_Id         IN  VARCHAR2 /* 등록자 ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         );                                             

/*******************************************************************************
  -- 카드즉시출금결제이력 Insert (수납 - 항상)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0205CrdHst(  v_Tord_No        IN  VARCHAR2    /* 통합청구계약번호 */
                                     , v_Cust_No        IN  VARCHAR2    /* 고객번호 */
                                     , v_Recp_Amt       IN  VARCHAR2   /* 수납금액 */
                                     , v_Email          IN  VARCHAR2      /* 주문자 E-Mail */
                                     , v_Tno            IN  VARCHAR2        /* 거래번호 */
                                     , v_Sec_Crd_No     IN  VARCHAR2 /* 카드번호 */
                                     , v_Crd_Cd         IN  VARCHAR2     /* 카드사코드 */
                                     , v_Crd_Nm         IN  VARCHAR2     /* 카드사명 */
                                     , v_App_Time       IN  VARCHAR2   /* 결제승인시간 */
                                     , v_App_No         IN  VARCHAR2    /* 승인번호 */
                                     , v_Noinf          IN  VARCHAR2     /* 무이자할부여부 */
                                     , v_Noinf_Type     IN  VARCHAR2 /* 무이자할부 이벤트 구분 */
                                     , v_Quota          IN  VARCHAR2      /* 할부개월 */
                                     , v_Res_Cd         IN  VARCHAR2     /* 결과코드 */
                                     , v_Res_Msg        IN  VARCHAR2    /* 결과내용 */
                                     , v_Reg_Id         IN  VARCHAR2     /* 등록자 ID */
                                     , v_Success_Code   OUT NUMBER
                                     , v_Return_Message OUT VARCHAR2
                                     , v_Error_Text     OUT VARCHAR2
                                    );
                                    
/*******************************************************************************
  -- 카드즉시출금취소이력 Insert (환불 - 항상)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0206CrdHst(  v_Tno            IN  VARCHAR2      /* 거래번호 */
                                       , v_Mod_Type       IN  VARCHAR2 /* 요청종류 */
                                       , v_Mod_Mny        IN  VARCHAR2  /* 취소요청금액 */
                                       , v_Rem_Mny        IN  VARCHAR2  /* 취소가능금액 */
                                       , v_Mod_Desc       IN  VARCHAR2 /* 취소사유 */
                                       , v_Res_Cd         IN  VARCHAR2   /* 결과코드 */
                                       , v_Res_Msg        IN  VARCHAR2  /* 결과내용 */
                                       , v_Reg_Id         IN  VARCHAR2   /* 등록자 ID */
                                       , v_Success_Code   OUT NUMBER
                                       , v_Return_Message OUT VARCHAR2
                                       , v_Error_Text     OUT VARCHAR2
                                      );
                                      
/*******************************************************************************
 -- 카드즉시출금결제 카드정보 Insert (수납 - 성공)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0202CrdHst(  v_Tno            IN  VARCHAR2        /* 거래번호 */
                                     , v_Sec_Crd_No     IN  VARCHAR2 /* 카드번호 */
                                     , v_Crd_Cd         IN  VARCHAR2     /* 카드사코드 */
                                     , v_Reg_Id         IN  VARCHAR2     /* 등록자 ID */
                                     , v_Success_Code   OUT NUMBER
                                     , v_Return_Message OUT VARCHAR2
                                     , v_Error_Text     OUT VARCHAR2
                                    );
                                           
END Pkg_Rtre0200;