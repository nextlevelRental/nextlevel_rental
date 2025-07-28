CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0050 AS
/*******************************************************************************
   NAME      Pkg_Rtre0050
   PURPOSE   결제정보 변경이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 결제정보 변경이력 Count
  *****************************************************************************/
  FUNCTION f_sRtre0050Count(
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE           /*결제변경요청순번    */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0050
    WHERE   RPC_SEQ = v_Rpc_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0050Count;

  /*****************************************************************************
  -- 결제정보 변경이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0050.BFCUST_NO%TYPE       /* 고객번호             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RPC_SEQ,                   /*결제변경요청순번    */
            A.ORD_NO,                    /*주문번호            */
            B.CAR_NO,                    /*차량번호            */
            B.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(B.CUST_NO) CUST_NM, /*고객명  */
            Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO) MAT_CD, /*상품코드*/
            Pkg_Rtsd0005.f_sRtsd0005MatName(Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO)) MAT_NM, /*상품명*/
            A.RPC_DAY,                   /*결제변경요청일      */
            A.RPC_UID,                   /*결제변경요청자      */
            A.RPC_CD,                    /*변경사유코드        */
            A.RPC_RSN,                   /*변경사유            */
            A.FILE_GRP_SEQ,              /*첨부파일            */
            /***************************************************************************/
            A.BFCUST_NO,                 /*변경전 고객번호     */
            A.BFTCGRP_NO,                /*변경전 통합청구번호 */
            A.BFPAY_MTHD,                /*변경전 결제방법     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', A.BFPAY_MTHD) BPAY_MTHD_NM, /*변경전 결제방법 */
            A.BFPAY_DD,                  /*변경전 결제일자     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R005', A.BFPAY_DD) BFPAY_DD_NM, /*변경전 결제일자     */
            A.BFACC_SEQ,                 /*변경전 계좌순번     */
            C.BANK_CD BFBANK_CD,         /*변경전 출금은행코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', C.BANK_CD) BFBANK_NM, /*변경전 출금은형명 */
            C.ACCT_NO BFACCT_NO,         /*변경전 출금계좌번호 */
            C.CUST_NM BFCUST_NM,         /*변경전 예금주       */
            A.BFCRD_SEQ,                 /*변경전 카드순번     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', D.CARDCOM_CD) BFCARDCOM_NM, /*변경전 출금은형명 */
            D.CARD_NO BFCAD_NO,          /*변경전 카드번호     */
            D.EXPIRE_YM BFEXPIRE_YM,     /*변경전 카드 유효기간*/
            CASE A.BFPAY_MTHD WHEN 'A' THEN C.EBIR_DAY
                              WHEN 'C' THEN D.EBIR_DAY
                                       ELSE NULL     END       BFEBIR_DAY,       /*변경전 법정생년원일 */
            CASE A.BFPAY_MTHD WHEN 'A' THEN C.BUSL_NO
                              WHEN 'C' THEN D.BUSL_NO
                                       ELSE NULL     END       BFBUS_NO,       /*변경전 사업자번호   */
            D.BATCH_KEY BFBATCH_KEY,     /*변경전 BATCH KEY    */
            A.BFBATCH_KEY,               /*변경전 BATCH KEY    */
            D.REG_ID BFREG_ID,           /*변경전 등록자ID     */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(D.REG_ID) BFREG_NM, /*변경전 등록자명       */
            A.BFACC_STAT,                /*변경전 계좌신청상태 */
            A.BFACRQ_ST,                 /*변경전 계좌해지 신청*/
            A.BFACRQ_FG,                 /*변경전 계좌신청 발생*/
            A.BFACRQ_DAY,                /*변경전 계좌해지 신청*/
            A.BFACRQ_SEQ,                /*변경전 계좌해지 신청*/
            A.BFRPC_SEQ,                 /*이전 변경후 수정내역*/
            /***************************************************************************/
            A.AFCUST_NO,                 /*변경후 고객번호     */
            A.AFTCGRP_NO,                /*변경후 통합청구번호 */
            A.AFPAY_MTHD,                /*변경후 결제방법     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', A.AFPAY_MTHD) APAY_MTHD_NM, /*변경후 결제방법 */
            A.AFPAY_DD,                  /*변경후 결제일자     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName(CASE WHEN A.AFPAY_MTHD = 'A' THEN 'R005' WHEN A.AFPAY_MTHD = 'C' THEN 'R006' ELSE NULL END , A.AFPAY_DD) AFPAY_DD_NM, /*변경후 결제일자     */
            A.AFACC_SEQ,                 /*변경후 계좌순번     */
            F.BANK_CD AFBANK_CD,         /*변경후 출금은행코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', F.BANK_CD) AFBANK_NM, /*변경후 출금은형명 */
            F.ACCT_NO AFACCT_NO,         /*변경후 출금계좌번호 */
            F.CUST_NM AFCUST_NM,         /*변경후 예금주       */
            A.AFCRD_SEQ,                 /*변경후 카드순번     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', G.CARDCOM_CD) AFCARDCOM_NM, /*변경후 출금은형명 */
            G.CARD_NO AFCAD_NO,          /*변경후 카드번호     */
            G.EXPIRE_YM AFEXPIRE_YM,     /*변경후 카드 유효기간*/
            CASE A.AFPAY_MTHD WHEN 'A' THEN F.EBIR_DAY
                              WHEN 'C' THEN G.EBIR_DAY
                                       ELSE NULL     END       AFEBIR_DAY,       /*변경후 법정생년원일 */
            CASE A.AFPAY_MTHD WHEN 'A' THEN F.BUSL_NO
                              WHEN 'C' THEN G.BUSL_NO
                                       ELSE NULL     END       AFBUS_NO,       /*변경후 사업자번호   */
            --G.BATCH_KEY AFBATCH_KEY,     /*변경후 BATCH KEY    */
            A.AFBATCH_KEY,               /*변경후 BATCH KEY    */
            G.REG_ID AFREG_ID,           /*변경후 등록자ID     */
            A.AFACC_STAT,                /*변경후 계좌신청 상태*/
            A.AFACRQ_ST,                 /*변경후 계좌신청 처리*/
            A.AFACRQ_FG,                 /*변경후 계좌신청 발생*/
            A.AFACRQ_DAY,                /*변경후 계좌신청 처리*/
            A.AFACRQ_SEQ,                /*변경후 계좌신청 순번*/
            A.ABRPC_SEQ,                 /*이전 변경전 수정내역*/
            /***************************************************************************/
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                  /*등록자명       */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                  /*변경자명       */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0050 A,
            RTSD0108 B,
            RTRE0010 C,
            RTRE0020 D,
            RTRE0010 F,
            RTRE0020 G
    WHERE   A.ORD_NO = B.ORD_NO
    AND     DECODE(A.BFPAY_MTHD, 'A', A.BFACC_SEQ) = C.ACC_SEQ(+)
    AND     DECODE(A.BFPAY_MTHD, 'C', A.BFCRD_SEQ) = D.CRD_SEQ(+)
    AND     DECODE(A.AFPAY_MTHD, 'A', A.AFACC_SEQ) = F.ACC_SEQ(+)
    AND     DECODE(A.AFPAY_MTHD, 'C', A.AFCRD_SEQ) = G.CRD_SEQ(+)
    AND     A.ORD_NO IN (SELECT  ORD_NO
                         FROM    RTSD0108
                         WHERE   ORD_NO  = DECODE(v_Ord_No, NULL, ORD_NO, v_Ord_No)
                         AND     CUST_NO = DECODE(v_Cust_No, NULL, CUST_NO, v_Cust_No)
                         )
    AND     A.DEL_YN = 'N'
    ORDER   BY A.RPC_SEQ DESC;

  END p_sRtre0050;

  /*****************************************************************************
  -- 결제정보 변경이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */
    v_Bfcrd_Seq      IN RTRE0050.BFCRD_SEQ%TYPE,      /*변경전 카드순번       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*변경전 계좌해지 신청  */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfrpc_Seq      IN RTRE0050.BFRPC_SEQ%TYPE,      /*이전 변경후 수정내역  */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */
    v_Afacc_Seq      IN RTRE0050.AFACC_SEQ%TYPE,      /*변경후 계좌순번       */
    v_Afcrd_Seq      IN RTRE0050.AFCRD_SEQ%TYPE,      /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*변경후 계좌신청 상태  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*변경후 계좌신청 처리상*/
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*변경후 계좌신청 순번  */
    v_Abrpc_Seq      IN RTRE0050.ABRPC_SEQ%TYPE,      /*이전 변경전 수정내역  */
    v_Del_Yn         IN RTRE0050.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0050 (
            RPC_SEQ,
            ORD_NO,
            RPC_DAY,
            RPC_UID,
            RPC_CD,
            RPC_RSN,
            FILE_GRP_SEQ,
            BFCUST_NO,
            BFTCGRP_NO,
            BFPAY_MTHD,
            BFPAY_DD,
            BFACC_SEQ,
            BFCRD_SEQ,
            BFBATCH_KEY,
            BFACC_STAT,
            BFACRQ_ST,
            BFACRQ_FG,
            BFACRQ_DAY,
            BFACRQ_SEQ,
            BFRPC_SEQ,
            AFCUST_NO,
            AFTCGRP_NO,
            AFPAY_MTHD,
            AFPAY_DD,
            AFACC_SEQ,
            AFCRD_SEQ,
            AFBATCH_KEY,
            AFACC_STAT,
            AFACRQ_ST,
            AFACRQ_FG,
            AFACRQ_DAY,
            AFACRQ_SEQ,
            ABRPC_SEQ,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rpc_Seq,
            v_Ord_No,
            v_Rpc_Day,
            v_Rpc_Uid,
            v_Rpc_Cd,
            v_Rpc_Rsn,
            v_File_Grp_Seq,
            v_Bfcust_No,
            v_Bftcgrp_No,
            v_Bfpay_Mthd,
            v_Bfpay_Dd,
            v_Bfacc_Seq,
            v_Bfcrd_Seq,
            v_Bfbatch_Key,
            v_Bfacc_Stat,
            v_Bfacrq_St,
            v_Bfacrq_Fg,
            v_Bfacrq_Day,
            v_Bfacrq_Seq,
            v_Bfrpc_Seq,
            v_Afcust_No,
            v_Aftcgrp_No,
            v_Afpay_Mthd,
            v_Afpay_Dd,
            v_Afacc_Seq,
            v_Afcrd_Seq,
            v_Afbatch_Key,
            v_Afacc_Stat,
            v_Afacrq_St,
            v_Afacrq_Fg,
            v_Afacrq_Day,
            v_Afacrq_Seq,
            v_Abrpc_Seq,
            v_Del_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0050;

  /*****************************************************************************
  -- 결제정보 변경이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */
    v_Bfcrd_Seq      IN RTRE0050.BFCRD_SEQ%TYPE,      /*변경전 카드순번       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*변경전 계좌해지 신청  */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfrpc_Seq      IN RTRE0050.BFRPC_SEQ%TYPE,      /*이전 변경후 수정내역  */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */
    v_Afacc_Seq      IN RTRE0050.AFACC_SEQ%TYPE,      /*변경후 계좌순번       */
    v_Afcrd_Seq      IN RTRE0050.AFCRD_SEQ%TYPE,      /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*변경후 계좌신청 상태  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*변경후 계좌신청 처리상*/
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*변경후 계좌신청 순번  */
    v_Abrpc_Seq      IN RTRE0050.ABRPC_SEQ%TYPE,      /*이전 변경전 수정내역  */
    v_Del_Yn         IN RTRE0050.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0050
    SET    ORD_NO        = v_Ord_No,
           RPC_DAY       = v_Rpc_Day,
           RPC_UID       = v_Rpc_Uid,
           RPC_CD        = v_Rpc_Cd,
           RPC_RSN       = v_Rpc_Rsn,
           FILE_GRP_SEQ  = v_File_Grp_Seq,
           BFCUST_NO     = v_Bfcust_No,
           BFTCGRP_NO    = v_Bftcgrp_No,
           BFPAY_MTHD    = v_Bfpay_Mthd,
           BFPAY_DD      = v_Bfpay_Dd,
           BFACC_SEQ     = v_Bfacc_Seq,
           BFCRD_SEQ     = v_Bfcrd_Seq,
           BFBATCH_KEY   = v_Bfbatch_Key,
           BFACC_STAT    = v_Bfacc_Stat,
           BFACRQ_ST     = v_Bfacrq_St,
           BFACRQ_FG     = v_Bfacrq_Fg,
           BFACRQ_DAY    = v_Bfacrq_Day,
           BFACRQ_SEQ    = v_Bfacrq_Seq,
           BFRPC_SEQ     = v_Bfrpc_Seq,
           AFCUST_NO     = v_Afcust_No,
           AFTCGRP_NO    = v_Aftcgrp_No,
           AFPAY_MTHD    = v_Afpay_Mthd,
           AFPAY_DD      = v_Afpay_Dd,
           AFACC_SEQ     = v_Afacc_Seq,
           AFCRD_SEQ     = v_Afcrd_Seq,
           AFBATCH_KEY   = v_Afbatch_Key,
           AFACC_STAT    = v_Afacc_Stat,
           AFACRQ_ST     = v_Afacrq_St,
           AFACRQ_FG     = v_Afacrq_Fg,
           AFACRQ_DAY    = v_Afacrq_Day,
           AFACRQ_SEQ    = v_Afacrq_Seq,
           ABRPC_SEQ     = v_Abrpc_Seq,
           DEL_YN        = v_Del_Yn,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE
    WHERE  RPC_SEQ       = v_Rpc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0050;


  /*****************************************************************************
  -- 결제정보 변경이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0050 (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0050
    SET     DEL_YN  = 'Y',
            CHG_ID  = v_Reg_Id,
            CHG_DT  = SYSDATE
    WHERE   RPC_SEQ = v_Rpc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0050;

  /*****************************************************************************
  -- 결제정보 변경이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0050 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청 처리일       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청 순번         */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */
    v_Bfacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경전 예금주명       */
    v_Bfacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경전계좌 고객유형   */
    v_Bfaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경전 법정생년월일   */
    v_Bfabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경전 계좌 사업자번호*/
    v_Bfbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경전 은행코드       */
    v_Bfacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경전 계좌번호       */
    v_Bfcrd_Seq      IN RTRE0020.CRD_SEQ%TYPE,        /*변경전 카드순번       */
    v_Bfccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경전 카드주명       */
    v_Bfccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경전카드고객유형    */
    v_Bfcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경전카드법정생년월일*/
    v_Bfcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경전카드사업자번호  */
    v_Bfcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경전카드사코드      */
    v_Bfcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경전 카드번호       */
    v_Bfexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경전 유효기간       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */
    v_Afacc_Seq      IN OUT RTRE0050.AFACC_SEQ%TYPE,  /*변경후 계좌순번       */
    v_Afacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경후 고객명         */
    v_Afacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경후 고객유형       */
    v_Afaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경후 법정생년월일   */
    v_Afabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경후 사업자번호     */
    v_Afbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경후 은행코드       */
    v_Afacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경후 계좌번호       */
    v_Afacc_Chk      IN RTRE0010.ACC_CHK%TYPE,        /*변경후 계좌확인상태   */
    v_Afcrd_Seq      IN OUT RTRE0050.AFCRD_SEQ%TYPE,  /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경후 카드주명       */
    v_Afccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경후카드고객유형    */
    v_Afcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경후카드법정생년월일*/
    v_Afcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경후카드사업자번호  */
    v_Afcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경후카드사코드      */
    v_Afcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경후 카드번호       */
    v_Afexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경후 유효기간       */
    v_Afbkey_Chk     IN RTRE0020.BKEY_CHK%TYPE,       /*변경후 카드확인 상태  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*결제변경요청순번      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 임시변수
    v_RpcAcc_Yn  RTRE0050.DEL_YN%TYPE DEFAULT NULL;     /*결제계좌 변경여부   */
    v_RpcDay_Yn  RTRE0050.DEL_YN%TYPE DEFAULT NULL;     /*결제일 변경여부     */
    v_Cust_No    RTSD0108.CUST_NO%TYPE DEFAULT NULL;    /*고객번호            */

    -- 04) 인증여부 검증
    v_Acert_Seq  RTRE0012.ACERT_SEQ%TYPE DEFAULT NULL;  /*계좌인증 순번       */
    v_CrdChk_Seq RTRE0012.ACERT_SEQ%TYPE DEFAULT NULL;  /*카드인증 순번       */

    -- 07) 변경전 계좌해지 신청 처리상태 획득(v_Bfacrq_St)
    v_Bfacrq_St  RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL;  /*변경전 계좌해지 신청*/

    -- 08) 변경후 계좌신청 상태(v_Afacc_Stat) /  변경후 계좌신청 처리상태(v_Afacrq_St) 획득
    v_Afacc_Stat RTRE0050.AFACC_STAT%TYPE DEFAULT NULL; /*변경후 계좌신청 상태  */
    v_Afacrq_St  RTRE0050.AFACRQ_ST%TYPE  DEFAULT NULL; /*변경후 계좌신청 처리상*/

    -- 09) 변경후 계좌신청 발생구분(v_Afacrq_Fg)/처리일(v_Afacrq_Day)/순번 획득(v_Afacrq_Seq)
    v_Afacrq_Fg  RTRE0050.AFACRQ_FG%TYPE DEFAULT NULL;  /*변경후 계좌신청 발생구*/
    v_Afacrq_Day RTRE0050.AFACRQ_DAY%TYPE DEFAULT NULL; /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq RTRE0050.AFACRQ_SEQ%TYPE DEFAULT NULL; /*변경후 계좌신청 순번  */

    -- DEFAULT NULL OR 'N'
    v_Bfacrq_Fg  RTRE0050.BFACRQ_FG%TYPE DEFAULT NULL; /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day RTRE0050.BFACRQ_DAY%TYPE DEFAULT NULL;/*변경전 계좌해지 신청  */
    v_Bfacrq_Seq RTRE0050.BFACRQ_SEQ%TYPE DEFAULT NULL;/*변경전 계좌해지 신청  */
    v_Bfrpc_Seq  RTRE0050.BFRPC_SEQ%TYPE DEFAULT NULL; /*이전 변경후 수정내역  */
    v_Abrpc_Seq  RTRE0050.ABRPC_SEQ%TYPE DEFAULT NULL; /*이전 변경전 수정내역  */
    v_Del_Yn     RTRE0050.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */

    v_Rcms_Day   RTRE0071.RCMS_DAY%TYPE DEFAULT NULL;  /*출금이체일자          */
    v_Rcms_Amt   RTRE0070.RCMS_AMT%TYPE DEFAULT 0;     /*출금청구금액          */
    v_Rcrd_Day   RTRE0081.RCRD_DAY%TYPE DEFAULT NULL;  /*카드이체일자          */
    v_Rcrd_Amt   RTRE0080.RCRD_AMT%TYPE DEFAULT 0;     /*카드청구금액          */

    e_Error EXCEPTION;
  BEGIN

    -- 01) 필수값:
    v_Return_Message := f_IUDRtre0050InputValueCheck (
                            v_Comm_Dvsn ,v_Ord_No ,v_Rpc_Day ,v_Rpc_Uid ,v_Rpc_Cd ,
                            v_Rpc_Rsn ,v_Acrq_Day ,v_Acrq_Seq ,v_File_Grp_Seq ,v_Bfcust_No ,
                            v_Bftcgrp_No ,v_Bfpay_Mthd ,v_Bfpay_Dd ,v_Bfacc_Seq ,v_Bfacust_Nm ,
                            v_Bfacust_Tp ,v_Bfaebir_Day ,v_Bfabusl_No ,v_Bfbank_No ,v_Bfacct_No ,
                            v_Bfcrd_Seq ,v_Bfccust_Nm ,v_Bfccust_Tp ,v_Bfcebir_Day ,v_Bfcbusl_No ,
                            v_Bfcardcom_No ,v_Bfcard_No ,v_Bfexpire_Ym ,v_Bfbatch_Key ,v_Bfacc_Stat ,
                            v_Afcust_No ,v_Aftcgrp_No ,v_Afpay_Mthd ,v_Afpay_Dd ,v_Afacc_Seq ,
                            v_Afacust_Nm ,v_Afacust_Tp ,v_Afaebir_Day ,v_Afabusl_No ,v_Afbank_No ,
                            v_Afacct_No ,v_Afacc_Chk ,v_Afcrd_Seq ,v_Afbatch_Key ,v_Afccust_Nm ,
                            v_Afccust_Tp ,v_Afcebir_Day ,v_Afcbusl_No ,v_Afcardcom_No ,v_Afcard_No ,
                            v_Afexpire_Ym ,v_Afbkey_Chk ,v_Reg_Id );
    IF TRIM(v_Return_Message) IS NOT NULL OR TRIM(v_Return_Message) != '' THEN
        v_ErrorText := v_Return_Message;
        RAISE e_Error;
    END IF;


    /* 02) 결제계좌 변경여부 : 이전 계좌정보와 이후계좌정보가 다른 경우 'Y', 동일한 경우 'N'
                          비교 대상 : 각각 변경전, 변경후 체크 - 고객번호, 결제방법, 계좌순번, 카드순번
                          신규(변경후 계좌순번 또는 카드순번이 없는 경우)에는 은행코드||계좌번호 또는 카드사코드||카드번호로 비교  */
    v_RpcAcc_Yn := 'N';
    IF v_Bfcust_No != v_Afcust_No OR    -- 고객번호
        v_Bfpay_Mthd != v_Afpay_Mthd OR -- 결제방법
        NVL(v_Bfacc_Seq, ' ') != NVL(v_Afacc_Seq, ' ') OR   -- 계좌순번
        NVL(v_Bfcrd_Seq, ' ') != NVL(v_Afcrd_Seq, ' ') THEN -- 카드순번

        v_RpcAcc_Yn := 'Y';
        IF v_Bfcust_No = v_Afcust_No AND v_Bfpay_Mthd = v_Afpay_Mthd AND v_Afpay_Mthd = 'A' THEN -- 고객번호, 결제방법(계좌)

            IF v_Bfbank_No = v_Afbank_No AND v_Bfacct_No = v_Afacct_No THEN --  은행코드||계좌번호
                v_RpcAcc_Yn := 'N';
            END IF;
        ELSIF v_Bfcust_No = v_Afcust_No AND v_Bfpay_Mthd = v_Afpay_Mthd AND v_Afpay_Mthd = 'C' THEN -- 고객번호, 결제방법(카드)

            IF v_Bfcardcom_No = v_Afcardcom_No AND v_Bfcard_No = v_Afcard_No THEN --   카드사코드||카드번호
                v_RpcAcc_Yn := 'N';
            END IF;
        END IF;
    END IF;

    /* 03) 결제일 변경여부 : 이전 결제일과 이후 결제일이 다른 경우 'Y', 동일한 경우 'N' */
    IF v_Bfpay_Dd != v_Afpay_Dd THEN
        v_RpcDay_Yn := 'Y';
    ELSE
        v_RpcDay_Yn := 'N';
    END IF;

    /* 결제정보변경사유: 01:장착확정 , 02:은행접수 해지 , 03:은행접수 신청 , 04:회사접수 , 05:양도양수 , 06:은행임의 해지 */
    IF v_Rpc_Cd IN ('04','05') THEN

        /* 04) 인증여부 검증
          . 저장되기 전 계좌 및 카드에 대한 인증 처리가 정상으로 된 경우 처리 가능함.
          . 계좌(RTRE0012),카드(RTRE0022) 테이블기준  카드사||카드번호 또는 은행코드||계좌번호로 당일 정상(Y)인 것이 있으면 OK */
        IF v_Afpay_Mthd = 'A' THEN -- 변경후 결제방법(A:계좌 , C: 카드)

            v_Acert_Seq := Pkg_Rtre0012.f_sRtre0012AcertChkSeq(v_Rpc_Day, v_Afbank_No, v_Afacct_No);

            IF v_Acert_Seq IS NULL THEN
                v_Return_Message := '결제변경요청일('||v_Rpc_Day||') 기준 변경후 은행코드('||v_Afbank_No||') , 변경후 계좌번호('||v_Afacct_No||')에 대한 인증처리가 정상적이지 않으므로 처리 불가합니다!';
                RAISE e_Error;
            END IF;

        ELSIF v_Afpay_Mthd = 'C' THEN

            v_CrdChk_Seq := Pkg_Rtre0022.f_sRtre0022CcertChkSeq(v_Rpc_Day, v_Afcardcom_No, v_Afcard_No);

            IF v_CrdChk_Seq IS NULL THEN
                v_Return_Message := '결제변경요청일('||v_Rpc_Day||') 기준 변경후카드사코드('||v_Afcardcom_No||') , 변경후 카드번호('||v_Afcard_No||')에 대한 인증처리가 정상적이지 않으므로 처리 불가합니다!';
                RAISE e_Error;
            END IF;

        END IF;

    END IF;

    /* 05) 최종 계좌상태 검증
    변경요청 계약번호로 RTRE0050 의 최종 이력에 대하여
    BFACRQ_ST(변경전 계좌해지 신청 처리상태), AFACRQ_ST(변경후 계좌신청 처리상태) 값이
    0' (신청대상), '1' (대상집계), '2'(전송), '6'(해지대상) 인 경우 등록 할 수 없다.    */
    IF v_Rpc_Cd != '01' THEN  -- 변경사유코드:01 장착확정

        IF f_sRtre0050FinalBfacrqSt(v_Ord_No) IN ('0','1','2','6') THEN
            v_Return_Message := '이전 결제정보 상태가 계좌신청 적용대상이므로 처리불가 합니다.';
            RAISE e_Error;
        END IF;

        IF f_sRtre0050FinalAfacrqSt(v_Ord_No) IN ('0','1','2','6') THEN
            v_Return_Message := '이후 결제정보 상태가 계좌신청 적용대상이므로 처리불가 합니다.';
            RAISE e_Error;
        END IF;
    END IF;

    /* 06) 변경전 고객번호 검증
       - 변경사유 은행접수 해지(02), 은행접수 신청(03), 회사접수(04), 은행임의 해지(06)인 경우
         계약번호기준 RTSD0108 장착정보의 고객번호와 동일하지 않으면 오류 처리   */
    IF v_Rpc_Cd IN ('02','03','04','06') THEN
        v_Cust_No := Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No);
        IF v_Bfcust_No != v_Cust_No THEN
            v_Return_Message := '변경전 고객번호('||v_Bfcust_No||')와 장착정보의 고객번호와('||v_Cust_No||')와 동일하지 않으므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    /* 07) 변경전 계좌해지 신청 처리상태 획득(v_Bfacrq_St) */
    v_Bfacrq_St := f_sRtre0050BfacrqSt(v_Rpc_Cd, v_Bfpay_Mthd, v_Bfacc_Stat, v_RpcAcc_Yn, v_RpcDay_Yn);
    IF v_Bfacrq_St = 'E' THEN
        v_Return_Message := '변경전 계좌해지 신청 처리상태(BFACRQ_ST) 값 획득에 실패하여 처리가 불가 합니다!(' || v_Rpc_Cd ||'|'|| v_Bfpay_Mthd ||'|'|| v_Bfacc_Stat ||'|'|| v_RpcAcc_Yn ||'|'|| v_RpcDay_Yn || ')';
        RAISE e_Error;
    END IF;

    /* 08) 변경후 계좌신청 상태(v_Afacc_Stat) /  변경후 계좌신청 처리상태(v_Afacrq_St) 획득 */
    IF 0 != f_sRtre0050AfaccStat(v_Rpc_Cd, v_Afpay_Mthd, v_RpcAcc_Yn, v_RpcDay_Yn, v_Bfacc_Stat, v_Afacc_Stat, v_Afacrq_St) THEN
        v_Return_Message := '변경후 계좌신청 상태(AFACC_STAT).변경후 계좌신청 처리상태(AFACRQ_ST) 값 획득에 실패하여 처리가 불가 합니다!(' || v_Rpc_Cd ||'|'|| v_Afpay_Mthd ||'|'|| v_RpcAcc_Yn ||'|'|| v_RpcDay_Yn ||'|'|| v_Bfacc_Stat ||'|'|| v_Afacc_Stat ||'|'|| v_Afacrq_St || ')';
        RAISE e_Error;
    END IF;


    /* 09) 변경후 계좌신청 발생구분(v_Afacrq_Fg)/처리일(v_Afacrq_Day)/순번 획득(v_Afacrq_Seq) */
    IF 0 != f_sRtre0050AfacrqFgDaySeq(v_Rpc_Cd, v_Acrq_Day, v_Acrq_Seq, v_Afacrq_Fg, v_Afacrq_Day, v_Afacrq_Seq) THEN
        v_Return_Message := '변경후 계좌신청 발생구분(AFACRQ_FG)/처리일(AFACRQ_DAY)/순번 획득(AFACRQ_SEQ) 값 획득에 실패하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /* 10) 결제변경요청순번*/
    v_Rpc_Seq := f_sRtre0050RpcSeq();

    /* 11) 등록/수정/삭제 - 현재 업무상 신규등록(I)만 존재함 */
    IF v_Comm_Dvsn = 'I' THEN

--        결제정보 변경하려는 계약번호에 대하여 출금이체 내역 체크
        Pkg_Rtre0071.p_sRtre0071Processing(v_Ord_No, v_Rcms_Day, v_Rcms_Amt,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF v_Rcms_Amt > 0 THEN
            v_Return_Message := '[CMS] 출금이체일자('||v_Rcms_Day||') 계약번호('||v_Ord_No||') 청구금액('||v_Rcms_Amt||') 청구진행중입니다.  변경할 수 없습니다.';           

            RAISE e_Error;
        END IF;

--        결제정보 변경하려는 계약번호에 대하여 카드이체 내역 체크
        Pkg_Rtre0081.p_sRtre0081Processing(v_Ord_No, v_Rcrd_Amt, v_Rcrd_Day,
                                           v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Rcrd_Amt > 0 THEN
            v_Return_Message := '[CARD] 카드이체일자('||v_Rcrd_Day||') 청구금액('||v_Rcrd_Amt||') 청구진행중입니다.  변경할 수 없습니다.';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtre0050(v_Rpc_Seq, v_Ord_No, v_Rpc_Day, v_Rpc_Uid, v_Rpc_Cd,
                                 v_Rpc_Rsn, v_File_Grp_Seq, v_Bfcust_No, v_Bftcgrp_No,
                                 v_Bfpay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq, v_Bfcrd_Seq, v_Bfbatch_Key,
                                 v_Bfacc_Stat, v_Bfacrq_St, v_Bfacrq_Fg, v_Bfacrq_Day,
                                 v_Bfacrq_Seq, v_Bfrpc_Seq, v_Afcust_No, v_Aftcgrp_No,
                                 v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq, v_Afcrd_Seq, v_Afbatch_Key,
                                 v_Afacc_Stat, v_Afacrq_St, v_Afacrq_Fg, v_Afacrq_Day,
                                 v_Afacrq_Seq, v_Abrpc_Seq, v_Del_Yn, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '결제정보 변경이력 등록 실패!!!'||'-'||v_ErrorText;
            RAISE e_Error;

        END IF;

        -- 장착확정(01) 아닌 경우에만
        IF v_Rpc_Cd != '01' THEN  -- 변경사유코드:01 장착확정

            -- 장착 정보 Update - 결제정보 변경이력 생성에 따른 변경
            IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108RpcInfoChange (v_Ord_No, v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq,
                                                                v_Afcrd_Seq, v_Afacc_Chk, v_Afacc_Stat, v_Afbkey_Chk,
                                                                v_Afbatch_Key, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '장착 정보 Update 실패!!!'||'-'||v_ErrorText;
                RAISE e_Error;

            END IF;

            -- 스케줄 Update - 결제정보 변경 또는 삭제시 해당 스케줄 내역(결제방법, 결제일, 만기계산기준일) 업데이트
            Pkg_Rtsd0109.p_UpdateRtsd0109(v_Ord_No, v_Afcust_No, v_Afpay_Mthd, v_Afpay_Dd,
                                          v_Rpc_Day, v_Reg_Id, v_Success_Code, v_Return_Message,
                                          v_ErrorText);
            IF 0 != v_Success_Code THEN
                v_Return_Message := '스케줄 Update 실패!!!'||'-'||v_Return_Message;
                RAISE e_Error;
            END IF;

        END IF;

    ELSE
        IF 0 = f_sRtre0050Count(v_Rpc_Seq) THEN
            v_Return_Message := '해당 결제변경요청순번('||v_Rpc_Seq||')은 미등록 상태이므로 처리(수정/삭제)불가!!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtre0050(v_Rpc_Seq, v_Ord_No, v_Rpc_Day, v_Rpc_Uid, v_Rpc_Cd,
                                     v_Rpc_Rsn, v_File_Grp_Seq, v_Bfcust_No, v_Bftcgrp_No,
                                     v_Bfpay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq, v_Bfcrd_Seq, v_Bfbatch_Key,
                                     v_Bfacc_Stat, v_Bfacrq_St, v_Bfacrq_Fg, v_Bfacrq_Day,
                                     v_Bfacrq_Seq, v_Bfrpc_Seq, v_Afcust_No, v_Aftcgrp_No,
                                     v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq, v_Afcrd_Seq, v_Afbatch_Key,
                                     v_Afacc_Stat, v_Afacrq_St, v_Afacrq_Fg, v_Afacrq_Day,
                                     v_Afacrq_Seq, v_Abrpc_Seq, v_Del_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '결제정보 변경이력 수정 실패!!!'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtre0050(v_Rpc_Seq, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '결제정보 변경이력 삭제 실패!!!'||'-'||v_ErrorText;
               RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0050.p_IUDRtre0050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0050.p_IUDRtre0050(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0050;


  /*****************************************************************************
  -- 결제정보 변경이력 관리(IUD) - 입력값 유효성 체크
  *****************************************************************************/
  FUNCTION f_IUDRtre0050InputValueCheck (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Rpc_Day        IN RTRE0050.RPC_DAY%TYPE,        /*결제변경요청일        */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE,        /*결제변경요청자        */
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Rpc_Rsn        IN RTRE0050.RPC_RSN%TYPE,        /*변경사유              */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청 처리일       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청 순번         */
    v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */
    v_Bfcust_No      IN RTRE0050.BFCUST_NO%TYPE,      /*변경전 고객번호       */
    v_Bftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경전 통합청구번호   */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfpay_Dd       IN RTRE0050.BFPAY_DD%TYPE,       /*변경전 결제일자       */
    v_Bfacc_Seq      IN RTRE0050.BFACC_SEQ%TYPE,      /*변경전 계좌순번       */
    v_Bfacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경전 예금주명       */
    v_Bfacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경전계좌 고객유형   */
    v_Bfaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경전 법정생년월일   */
    v_Bfabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경전 계좌 사업자번호*/
    v_Bfbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경전 은행코드       */
    v_Bfacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경전 계좌번호       */
    v_Bfcrd_Seq      IN RTRE0020.CRD_SEQ%TYPE,        /*변경전 카드순번       */
    v_Bfccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경전 카드주명       */
    v_Bfccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경전카드고객유형    */
    v_Bfcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경전카드법정생년월일*/
    v_Bfcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경전카드사업자번호  */
    v_Bfcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경전카드사코드      */
    v_Bfcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경전 카드번호       */
    v_Bfexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경전 유효기간       */
    v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Afcust_No      IN RTRE0050.AFCUST_NO%TYPE,      /*변경후 고객번호       */
    v_Aftcgrp_No     IN RTRE0050.AFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_Afpay_Dd       IN RTRE0050.AFPAY_DD%TYPE,       /*변경후 결제일자       */
    v_Afacc_Seq      IN OUT RTRE0050.AFACC_SEQ%TYPE,  /*변경후 계좌순번       */
    v_Afacust_Nm     IN RTRE0010.CUST_NM%TYPE,        /*변경후 고객명         */
    v_Afacust_Tp     IN RTRE0010.CUST_TP%TYPE,        /*변경후 고객유형       */
    v_Afaebir_Day    IN RTRE0010.EBIR_DAY%TYPE,       /*변경후 법정생년월일   */
    v_Afabusl_No     IN RTRE0010.BUSL_NO%TYPE,        /*변경후 사업자번호     */
    v_Afbank_No      IN RTRE0010.BANK_CD%TYPE,        /*변경후 은행코드       */
    v_Afacct_No      IN RTRE0010.ACCT_NO%TYPE,        /*변경후 계좌번호       */
    v_Afacc_Chk      IN RTRE0010.ACC_CHK%TYPE,        /*변경후 계좌확인상태   */
    v_Afcrd_Seq      IN OUT RTRE0050.AFCRD_SEQ%TYPE,  /*변경후 카드순번       */
    v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */
    v_Afccust_Nm     IN RTRE0020.CUST_NM%TYPE,        /*변경후 카드주명       */
    v_Afccust_Tp     IN RTRE0020.CUST_TP%TYPE,        /*변경후카드고객유형    */
    v_Afcebir_Day    IN RTRE0020.EBIR_DAY%TYPE,       /*변경후카드법정생년월일*/
    v_Afcbusl_No     IN RTRE0020.BUSL_NO%TYPE,        /*변경후카드사업자번호  */
    v_Afcardcom_No   IN RTRE0020.CARDCOM_CD%TYPE,     /*변경후카드사코드      */
    v_Afcard_No      IN RTRE0020.CARD_NO%TYPE,        /*변경후 카드번호       */
    v_Afexpire_Ym    IN RTRE0020.EXPIRE_YM%TYPE,      /*변경후 유효기간       */
    v_Afbkey_Chk     IN RTRE0020.BKEY_CHK%TYPE,       /*변경후 카드확인 상태  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE          /*등록자 ID             */
    ) RETURN VARCHAR2 IS

    v_Return_Message VARCHAR2(2000) DEFAULT NULL;
    e_Error EXCEPTION;

    v_Success_Code   NUMBER;
    v_Message        VARCHAR2(2000) DEFAULT NULL;
    v_ErrorText      VARCHAR2(2000) DEFAULT NULL;

    v_Acc_Seq   RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*계좌순번              */
    v_Crd_Seq   RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*카드순번              */

    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
  BEGIN


    -- 필수값:
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Rpc_Day) THEN
        v_Return_Message := '결제변경요청일('||v_Rpc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Rpc_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R013', v_Rpc_Cd)) THEN
        v_Return_Message := '변경사유코드('||v_Rpc_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rpc_Rsn) IS NULL THEN
        v_Return_Message := '변경사유('||v_Rpc_Rsn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 변경사유가 02' 은행접수 해지 '03' 은행접수 신청 '06' 은행 임의해지 시에만 필수 체크
    IF v_Rpc_Cd IN ('02','03','06') THEN

        IF 0 != ISDATE(v_Acrq_Day) THEN
            v_Return_Message := '계좌신청 처리일('||v_Acrq_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Acrq_Seq) IS NULL THEN
            v_Return_Message := '계좌신청 순번('||v_Acrq_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    --v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청 순번         */
    --v_File_Grp_Seq   IN RTRE0050.FILE_GRP_SEQ%TYPE,   /*첨부파일              */

    /***************************************** 변경 (전) ********************************************/

    -- 변경전 정보는 변경사유가 장착확정(01)을 제외하고 모두 필수 입력항목임
    IF '01' != TRIM(v_Rpc_Cd) THEN


        IF (TRIM(v_Bfcust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Bfcust_No)) THEN
            v_Return_Message := '변경전 고객번호('||v_Bfcust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 장착정보(RTSD0108)의 데이터와 비교해서 다르면 에러 -  '05' 양도양수인 경우 제외
        IF v_Rpc_Cd != '05' THEN


            IF 0 = Pkg_Rtsd0108.f_sRtsd0108CheckCount(v_Ord_No, v_Bfcust_No, v_Bftcgrp_No) THEN
                v_Return_Message := '변경전 고객번호('||v_Bfcust_No||') 통합청구번호('||v_Bftcgrp_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

        END IF;

        IF (TRIM(v_Bfpay_Mthd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R004', v_Bfpay_Mthd)) THEN
            v_Return_Message := '변경전 결제방법('||v_Bfpay_Mthd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        /* 결제방법 (계좌) */
        IF TRIM(v_Bfpay_Mthd) = 'A' THEN

            IF (TRIM(v_Bfpay_Dd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R005', v_Bfpay_Dd)) THEN
                v_Return_Message := '변경전 결제일자('||v_Bfpay_Dd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF (TRIM(v_Bfacc_Seq) IS NOT NULL) AND (0 = Pkg_Rtre0010.f_sRtre0010Count(v_Bfacc_Seq)) THEN
                v_Return_Message := '변경전 계좌순번('||v_Bfacc_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;


            IF TRIM(v_Bfacust_Nm) IS NULL THEN
                v_Return_Message := '변경전 예금주명('||v_Bfacust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF (TRIM(v_Bfacust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Bfacust_Tp)) THEN
                v_Return_Message := '변경전 계좌 고객유형('||v_Bfacust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            -- 개인(01), 사업자(02)
            IF TRIM(v_Bfacust_Tp) = '01' THEN

                IF TRIM(v_Bfaebir_Day) IS NULL THEN
                    v_Return_Message := '변경전 법정생년월일('||v_Bfaebir_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
            ELSE
                IF TRIM(v_Bfabusl_No) IS NULL THEN
                    v_Return_Message := '변경전 계좌 사업자번호('||v_Bfabusl_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
            END IF;

            IF (TRIM(v_Bfbank_No) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R001', v_Bfbank_No)) THEN
                v_Return_Message := '변경전 은행코드('||v_Bfbank_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;


            IF TRIM(v_Bfacct_No) IS NULL THEN
                v_Return_Message := '변경전 계좌번호('||v_Bfacct_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            v_Acc_Seq := Pkg_Rtre0010.f_sRtre0010AcctNo(v_Bfcust_No, v_Bfbank_No, v_Bfacct_No);
            -- 변경전  계좌순번기준 입력된 고객/은행/계좌와 다르면 에러처리
            IF (TRIM(v_Bfacc_Seq) IS NOT NULL) AND (v_Bfacc_Seq != v_Acc_Seq) THEN
                v_Return_Message := '변경전 계좌순번('||v_Bfacc_Seq||') 기준 정보와 입력한 변경후 고객번호('||v_Bfcust_No||') 은행코드('||v_Bfbank_No||') 계좌번호('||v_Bfacct_No||') 정보가  일치하지 않으므로 처리가 불가합니다!';
                RAISE e_Error;
            END IF;


        /* 결제방법 (카드) */
        ELSIF TRIM(v_Bfpay_Mthd) = 'C' THEN

            IF (TRIM(v_Bfpay_Dd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R006', v_Bfpay_Dd)) THEN
                v_Return_Message := '변경전 결제일자('||v_Bfpay_Dd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF (TRIM(v_Bfcrd_Seq) IS NOT NULL) AND (0 = Pkg_Rtre0020.f_sRtre0020Count(v_Bfcrd_Seq)) THEN
                v_Return_Message := '변경전 카드순번('||v_Bfcrd_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_Bfccust_Nm) IS NULL THEN
                v_Return_Message := '변경전 카드주명('||v_Bfccust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF (TRIM(v_Bfccust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Bfccust_Tp)) THEN
                v_Return_Message := '변경전카드고객유형('||v_Bfccust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            -- 개인(01), 사업자(02)
            IF TRIM(v_Bfccust_Tp) = '01' THEN

                IF TRIM(v_Bfcebir_Day) IS NULL THEN
                    v_Return_Message := '변경전카드법정생년월일('||v_Bfcebir_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
            ELSE
                IF TRIM(v_Bfcbusl_No) IS NULL THEN
                    v_Return_Message := '변경전카드사업자번호('||v_Bfcbusl_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
            END IF;

            IF (TRIM(v_Bfcardcom_No) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R002', v_Bfcardcom_No)) THEN
                v_Return_Message := '변경전카드사코드('||v_Bfcardcom_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_Bfcard_No) IS NULL THEN
                v_Return_Message := '변경전 카드번호('||v_Bfcard_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_Bfexpire_Ym) IS NULL THEN
                v_Return_Message := '변경전 유효기간('||v_Bfexpire_Ym||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            --v_Bfbatch_Key    IN RTRE0050.BFBATCH_KEY%TYPE,    /*변경전 BATCH KEY      */
            --v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */

            v_Crd_Seq := Pkg_Rtre0020.f_sRtre0020CrdSeq(v_Bfcust_No, v_Bfcardcom_No, v_Bfcard_No, v_Bfexpire_Ym);
            -- 변경전  카드순번기준 입력된 카드사/카드번호/유효기간이 다르면 에러처리
            IF (TRIM(v_Bfcrd_Seq) IS NOT NULL) AND (v_Bfcrd_Seq != v_Crd_Seq) THEN
                v_Return_Message := '변경전 카드순번('||v_Bfcrd_Seq||') 기준 정보와 입력한 변경후 고객번호('||v_Bfcust_No||') 카드사코드('||v_Bfcardcom_No||') 카드번호('||v_Bfcard_No||') 유효기간('||v_Bfexpire_Ym||') 정보가  일치하지 않으므로 처리가 불가합니다!';
                RAISE e_Error;
            END IF;


        END IF;

    END IF;

    /***************************************** 변경 (후) ********************************************/
    -- 변경후 정보는 변경사유와 상관 없이 필수 입력 체크 함.

    IF (TRIM(v_Afcust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Afcust_No)) THEN
        v_Return_Message := '변경후 고객번호('||v_Afcust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --v_Aftcgrp_No     IN RTRE0050.BFTCGRP_NO%TYPE,     /*변경후 통합청구번호   */

    IF (TRIM(v_Afpay_Mthd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R004', v_Afpay_Mthd)) THEN
        v_Return_Message := '변경후 결제방법('||v_Afpay_Mthd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*  결제방법 (계좌) */
    IF TRIM(v_Afpay_Mthd) = 'A' THEN

        IF (TRIM(v_Afpay_Dd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R005', v_Afpay_Dd)) THEN
            v_Return_Message := '변경후 결제일자('||v_Afpay_Dd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Afacc_Seq) IS NOT NULL) AND (0 = Pkg_Rtre0010.f_sRtre0010Count(v_Afacc_Seq)) THEN
            v_Return_Message := '변경후 계좌순번('||v_Afacc_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Afacust_Nm) IS NULL THEN
            v_Return_Message := '변경후 예금주명('||v_Afacust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Afacust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Afacust_Tp)) THEN
            v_Return_Message := '변경후계좌 고객유형('||v_Afacust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 개인(01), 사업자(02)
        IF TRIM(v_Afacust_Tp) = '01' THEN

            IF TRIM(v_Afaebir_Day) IS NULL THEN
                v_Return_Message := '변경후 법정생년월일('||v_Afaebir_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
        ELSE
            IF TRIM(v_Afabusl_No) IS NULL THEN
                v_Return_Message := '변경후 계좌 사업자번호('||v_Afabusl_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
        END IF;

        IF (TRIM(v_Afbank_No) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R001', v_Afbank_No)) THEN
            v_Return_Message := '변경후 은행코드('||v_Afbank_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Afacct_No) IS NULL THEN
            v_Return_Message := '변경후 계좌번호('||v_Afacct_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Afacc_Chk) IS NULL) OR (TRIM(v_Afacc_Chk) NOT IN ('Y','N')) THEN
            v_Return_Message := '변경후 계좌확인상태('||v_Afacc_Chk||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_Acc_Seq := Pkg_Rtre0010.f_sRtre0010AcctNo(v_Afcust_No, v_Afbank_No, v_Afacct_No);
        -- 변경후 계좌순번기준 입력된 고객/은행/계좌이 다르면 에러처리
        IF (TRIM(v_Afacc_Seq) IS NOT NULL) AND (v_Afacc_Seq != v_Acc_Seq) THEN
            v_Return_Message := '변경후 카드순번('||v_Afacc_Seq||') 기준 정보와 입력한 변경후 고객번호('||v_Afcust_No||') 은행코드('||v_Afbank_No||') 계좌번호('||v_Afacct_No||') 정보가  일치하지 않으므로 처리가 불가합니다!';
            RAISE e_Error;
        END IF;

        -- 신규 등록인데, 동일 고객/은행/계좌으로  존재하면, 에러처리
        IF (TRIM(v_Afacc_Seq) IS NULL) THEN

            IF (v_Acc_Seq IS NOT NULL) THEN

                BEGIN

                    SELECT  ACC_SEQ  INTO v_Afacc_Seq
                    FROM    RTRE0010
                    WHERE   ACC_SEQ = v_Acc_Seq
                    AND     CUST_NO = v_Afcust_No
                    AND     BANK_CD = v_Afbank_No
                    AND     ACCT_NO = v_Afacct_No
                    AND     DECODE( CUST_TP, '01', EBIR_DAY, BUSL_NO ) = DECODE( v_Afacust_Tp, '01', v_Afaebir_Day, v_Afabusl_No );

                    v_exist := TRUE;

                    EXCEPTION
                      WHEN NO_DATA_FOUND THEN
                        v_exist := FALSE;
                END;

                IF v_exist = FALSE THEN
                    v_Return_Message := '고객 계좌 정보(RTRE0010)에 해당 정보('||v_Acc_Seq ||'-'|| v_Afcust_No ||'-'
                                                                               ||v_Afbank_No ||'-'|| v_Afacct_No ||'-'
                                                                               || v_Afacust_Tp ||'-'|| v_Afaebir_Day ||'-'
                                                                               || v_Afabusl_No||')가 존재하지 않음으로 처리가 불가 합니다.!';
                    RAISE e_Error;
                END IF;

                IF (TRIM(v_Afacc_Seq) IS NULL) THEN
                    v_Return_Message := '변경후 고객번호('||v_Afcust_No||') 은행코드('||v_Afbank_No||') 계좌번호('||v_Afacct_No||')로 이미 등록된 계좌순번이 있으므로 처리가 불가합니다!';
                    RAISE e_Error;
                END IF;
            END IF;

            IF (v_Afacc_Seq IS NULL) THEN
                -- 계좌 신규 생성
                Pkg_Rtre0010.p_IUDRtre0010 ('I', v_Afacc_Seq, v_Afcust_No, v_Afacust_Nm,
                                            v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No,
                                            v_Afacct_No, v_Afacc_Chk, NULL, NULL,
                                            'Y', v_Reg_Id, v_Success_Code, v_Message, v_ErrorText);
                IF (0 != v_Success_Code) THEN
                    v_Return_Message := v_Message||':'||v_ErrorText;
                    RAISE e_Error;
                END IF;
            END IF;

        END IF;

    ELSIF TRIM(v_Afpay_Mthd) = 'C' THEN -- 결제방법 (카드)

        IF (TRIM(v_Afpay_Dd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R006', v_Afpay_Dd)) THEN
            v_Return_Message := '변경전 결제일자('||v_Afpay_Dd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Afcrd_Seq) IS NOT NULL) AND (0 = Pkg_Rtre0020.f_sRtre0020Count(v_Afcrd_Seq)) THEN
            v_Return_Message := '변경후 카드순번('||v_Afcrd_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        --v_Afbatch_Key    IN RTRE0050.AFBATCH_KEY%TYPE,    /*변경후 BATCH KEY      */

        IF TRIM(v_Afccust_Nm) IS NULL THEN
            v_Return_Message := '변경후 카드주명('||v_Afccust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Afccust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Afccust_Tp)) THEN
            v_Return_Message := '변경후카드고객유형('||v_Afccust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 개인(01), 사업자(02)
        IF TRIM(v_Afccust_Tp) = '01' THEN

            IF TRIM(v_Afcebir_Day) IS NULL THEN
                v_Return_Message := '변경후카드법정생년월일('||v_Afcebir_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
        ELSE
            IF TRIM(v_Afcbusl_No) IS NULL THEN
                v_Return_Message := '변경후카드사업자번호('||v_Afcbusl_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
        END IF;

        IF (TRIM(v_Afcardcom_No) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R002', v_Afcardcom_No)) THEN
            v_Return_Message := '변경후카드사코드('||v_Afcardcom_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Afcard_No) IS NULL THEN
            v_Return_Message := '변경후 카드번호('||v_Afcard_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Afexpire_Ym) IS NULL THEN
            v_Return_Message := '변경후 유효기간('||v_Afexpire_Ym||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Afbkey_Chk) IS NULL) OR (TRIM(v_Afbkey_Chk) NOT IN ('Y','N')) THEN
            v_Return_Message := '변경후 카드확인 상태('||v_Afbkey_Chk||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_Crd_Seq := Pkg_Rtre0020.f_sRtre0020CrdSeq(v_Afcust_No, v_Afcardcom_No, v_Afcard_No, v_Afexpire_Ym);
        -- 변경후  카드순번기준 입력된 카드사/카드번호/유효기간이 다르면 에러처리
        IF (TRIM(v_Afcrd_Seq) IS NOT NULL) AND (v_Afcrd_Seq != v_Crd_Seq) THEN
            v_Return_Message := '변경후 카드순번('||v_Afcrd_Seq||') 기준 정보와 입력한 변경후 고객번호('||v_Afcust_No||') 카드사코드('||v_Afcardcom_No||') 카드번호('||v_Afcard_No||') 유효기간('||v_Afexpire_Ym||') 정보가  일치하지 않으므로 처리가 불가합니다!';
            RAISE e_Error;
        END IF;

        -- 신규 등록인데, 동일 고객코드/ 카드사/카드번호/유효기간으로  존재하면, 에러처리
        IF (TRIM(v_Afcrd_Seq) IS NULL) THEN

            IF (v_Crd_Seq IS NOT NULL) THEN

                BEGIN
                    SELECT CRD_SEQ  INTO v_Afcrd_Seq
                    FROM RTRE0020
                    WHERE CRD_SEQ    = v_Crd_Seq
                    AND   CUST_NO    = v_Afcust_No
                    AND   CARDCOM_CD = v_Afcardcom_No
                    AND   CARD_NO    = v_Afcard_No
                    AND   EXPIRE_YM  = v_Afexpire_Ym
                    AND   DECODE( CUST_TP, '01', EBIR_DAY, BUSL_NO ) = DECODE( v_Afccust_Tp, '01', v_Afcebir_Day, v_Afcbusl_No );

                    v_exist := TRUE;

                    EXCEPTION
                      WHEN NO_DATA_FOUND THEN
                        v_exist := FALSE;
                END;

                IF v_exist = FALSE THEN
                    v_Return_Message := '고객 카드 정보(RTRE0020)에 해당 정보('||v_Crd_Seq ||'-'|| v_Afcust_No ||'-'
                                                                               ||v_Afcardcom_No ||'-'|| v_Afcard_No ||'-'
                                                                               || v_Afexpire_Ym ||'-'|| v_Afccust_Tp ||'-'
                                                                               || v_Afcebir_Day||'-'||v_Afcbusl_No||')가 존재하지 않음으로 처리가 불가 합니다.!';
                    RAISE e_Error;
                END IF;

                IF (TRIM(v_Afcrd_Seq) IS NULL) THEN
                    v_Return_Message := '변경후 고객번호('||v_Afcust_No||') 카드사코드('||v_Afcardcom_No||') 카드번호('||v_Afcard_No||')  유효기간('||v_Afexpire_Ym||')로 이미 등록된 계좌순번이 있으므로 처리가 불가합니다!';
                    RAISE e_Error;
                END IF;

            END IF;

            -- 신규 카드 생성
            IF (TRIM(v_Afcrd_Seq) IS NULL) THEN
                Pkg_Rtre0020.p_IUDRtre0020 ('I', v_Afcrd_Seq, v_Afcust_No, v_Afccust_Nm,
                                              v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No, v_Afcardcom_No,
                                              v_Afcard_No, v_Afexpire_Ym, v_Afbkey_Chk, v_Afbatch_Key,
                                              NULL, NULL, 'Y', v_Reg_Id,
                                              v_Success_Code, v_Message, v_ErrorText);
                IF (0 != v_Success_Code) THEN
                    v_Return_Message := v_Message||':'||v_ErrorText;
                    RAISE e_Error;
                END IF;
            END IF;

        END IF;

    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
    END IF;

    RETURN v_Return_Message;

    EXCEPTION
      WHEN e_Error THEN
        RETURN v_Return_Message;
      WHEN OTHERS THEN
        RETURN 'Input Value Check Error !!!. - '||SUBSTR(SQLERRM, 1, 200);

  END f_IUDRtre0050InputValueCheck;

  /*****************************************************************************
  -- 결제정보 조회 Select
  -- 2016-06-08 이영근, 생년월일, 휴대폰번호 컬럼 추가
  *****************************************************************************/
  PROCEDURE p_sRtre0050List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0050.BFCUST_NO%TYPE       /*고객번호              */
    ) IS

  BEGIN

   OPEN Ref_Cursor FOR
   SELECT   A.ORD_NO,                /*주문번호     */
            A.CAR_NO,                /*차량번호     */
            A.CUST_NO,               /*고객번호     */
            A.CUST_TP,               /*고객유형     */
            B.CUST_TP2,              /*고객유형2    */
            B.CUST_NM,               /*고객명       */
            Pkg_Rtsd0005.f_sRtsd0005MatName(Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO)) AS MAT_NM, /*상품명*/
            A.PAY_MTHD,              /*결제방법     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', A.PAY_MTHD) PAY_MTHD_NM,  /*결제방법   */
            A.PAY_DD,                /*결제일       */
            A.TCGRP_NO,              /*통합청구번호 */
            A.BATCH_KEY,             /*BATCH KEY    */
            A.ACC_STAT,              /*계좌신청상태 */
            C.BANK_CD,               /*은행코드     */
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R001', C.BANK_CD) AS BANK_NM,   /*은행명    */
            C.ACCT_NO,               /*계좌번호     */
            C.CUST_TP AS PCUST_TP,   /*결제고객구분 */
            C.CUST_NM AS DEPOSITOR,  /*예금주       */
            C.ACC_SEQ,               /*계좌순번     */
            NULL AS CRD_SEQ,         /*카드순번     */
            NULL AS CARDCOM_CD,      /*카드사코드   */
            NULL AS CARDCOM_NM,      /*카드사명     */
            NULL AS CARD_NO,         /*카드번호     */
            NULL AS EXPIRE_YM,       /*유효기간     */
            C.EBIR_DAY AS EBIR_DAY,  /*법정생년월일 */
            C.BUSL_NO AS BUSL_NO,    /*사업자번호   */
            0 AS ARREARS_AMT,        /*미납액       */
            Pkg_Rtre0050.f_sDelete0050Tp(A.ORD_NO) AS DELETE_TP, /*삭제가능여부 */
            C.ACC_CHK,               /*계좌확인상태 */
            NULL AS BKEY_CHK,        /*카드확인상태 */
            B.O_BIRTHDAY,            /*사업주 법정생년월일*/
            B.O_CUSTNM,              /*사업주명           */
            B.BUSL_NO AS O_BUSL_NO,   /*고객사업자번호     */
            B.BIRTH_DAY,
            B.MOB_NO,
            B.SAFEKEY,
            (SELECT E.CERT_CD FROM RTSD0110 E WHERE E.CUST_NO = B.CUST_NO AND E.SEQ = (SELECT MAX(F.SEQ) FROM RTSD0110 F WHERE F.CUST_NO = B.CUST_NO)) AS CERT_CD,
            B.MOB_FIRM,
            B.LF_CD,
            B.GENDER_CD,
            CASE WHEN A.STAT_CD = '04' THEN CASE WHEN A.OS_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') AND A.MFP_YN = 'N' THEN '계약중'
                								 ELSE '계약종료'
											 END || CASE WHEN Pkg_Rtre0035.f_sRtre0035BalanceAmt(A.ORD_NO, A.CUST_NO) > 0 THEN '/선납'
												 		 ELSE ''
													 END
				 ELSE '-'
			 END AS STAT_NM_DETAIL,	/*상태상세*/
            NVL((SELECT TO_CHAR(SUM(X.ARRE_AMT))
				   FROM RTSD0109 X
				  WHERE X.ORD_NO = A.ORD_NO
					AND X.ARRE_AMT > 0
					AND X.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
					AND X.SCD_STAT = 'S'), '-') AS OVER_DUE_AMT,	/*연체금액*/
            CASE WHEN A.MFP_YN = 'Y' THEN CASE WHEN A.BOND_SEL_CD IS NOT NULL THEN TO_NUMBER(A.BOND_SEL_CD) || '차 채권매각'
											   WHEN A.END_TP = 'E' THEN '중도완납'
											   ELSE '중도해지'
										   END
				 ELSE '-'
			 END AS MFP_YN	/*완납/해지/채권*/
    FROM    RTSD0108 A,              /*장착정보T    */
            RTSD0100 B,              /*고객마스터T  */
            RTRE0010 C               /*고객계좌정보T*/
    WHERE   A.CUST_NO  = B.CUST_NO
    AND     A.CUST_NO  = C.CUST_NO
    AND     A.PAY_MTHD = 'A'
    AND     A.ACC_SEQ  = C.ACC_SEQ
    --AND     C.USE_YN = 'Y'  -- 20151109 계좌/카드 사용중지으로 수정
    AND     A.ORD_NO IN (SELECT  ORD_NO
                         FROM    RTSD0108
                         WHERE   ORD_NO  = DECODE(v_Ord_No, NULL, ORD_NO, v_Ord_No)
                         AND     CUST_NO = DECODE(v_Cust_No, NULL, CUST_NO, v_Cust_No)
                         )
    UNION ALL
    SELECT  A.ORD_NO,                /*주문번호     */
            A.CAR_NO,                /*차량번호     */
            A.CUST_NO,               /*고객번호     */
            A.CUST_TP,               /*고객유형     */
            B.CUST_TP2,              /*고객유형2    */
            B.CUST_NM,               /*고객명       */
            Pkg_Rtsd0005.f_sRtsd0005MatName(Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO)) AS MAT_NM, /*상품명*/
            A.PAY_MTHD,              /*결제방법     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', A.PAY_MTHD) PAY_MTHD_NM,  /*결제방법*/
            A.PAY_DD,                /*결제일       */
            A.TCGRP_NO,              /*통합청구번호 */
            A.BATCH_KEY,             /*BATCH KEY    */
            A.ACC_STAT,              /*계좌신청상태 */
            NULL AS BANK_CD,         /*은행코드     */
            NULL AS BANK_NM,         /*은행명       */
            NULL AS ACCT_NO,         /*계좌번호     */
            D.CUST_TP AS PCUST_TP,   /*결제고객구분 */
            D.CUST_NM AS DEPOSITOR,  /*예금주       */
            NULL AS ACC_SEQ,         /*계좌순번     */
            D.CRD_SEQ AS CRD_SEQ,    /*카드순번     */
            D.CARDCOM_CD,            /*카드사코드   */
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R002', D.CARDCOM_CD) AS CARDCOM_NM,   /*카드사명    */
            D.CARD_NO,               /*카드번호     */
            D.EXPIRE_YM,             /*유효기간     */
            D.EBIR_DAY,              /*법정생년월일 */
            D.BUSL_NO,               /*사업자번호   */
            0 AS ARREARS_AMT,        /*미납액       */
            Pkg_Rtre0050.f_sDelete0050Tp(A.ORD_NO) AS DELETE_TP, /*삭제가능여부 */
            NULL AS ACC_CHK,         /*계좌확인상태 */
            D.BKEY_CHK,              /*카드확인상태 */
            B.O_BIRTHDAY,            /*사업주 법정생년월일*/
            B.O_CUSTNM,              /*사업주명           */
            B.BUSL_NO AS O_BUSL_NO,   /*고객사업자번호     */
            B.BIRTH_DAY,
            B.MOB_NO,
            B.SAFEKEY,
            (SELECT E.CERT_CD FROM RTSD0110 E WHERE E.CUST_NO = B.CUST_NO AND E.SEQ = (SELECT MAX(F.SEQ) FROM RTSD0110 F WHERE F.CUST_NO = B.CUST_NO)) AS CERT_CD,
            B.MOB_FIRM,    
            B.LF_CD,
            B.GENDER_CD,
            CASE WHEN A.STAT_CD = '04' THEN CASE WHEN A.OS_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') AND A.MFP_YN = 'N' THEN '계약중'
                								 ELSE '계약종료'
											 END || CASE WHEN Pkg_Rtre0035.f_sRtre0035BalanceAmt(A.ORD_NO, A.CUST_NO) > 0 THEN '/선납'
												 		 ELSE ''
													 END
				 ELSE '-'
			 END AS STAT_NM_DETAIL,	/*상태상세*/
            NVL((SELECT TO_CHAR(SUM(X.ARRE_AMT))
				   FROM RTSD0109 X
				  WHERE X.ORD_NO = A.ORD_NO
					AND X.ARRE_AMT > 0
					AND X.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
					AND X.SCD_STAT = 'S'), '-') AS OVER_DUE_AMT,	/*연체금액*/
            CASE WHEN A.MFP_YN = 'Y' THEN CASE WHEN A.BOND_SEL_CD IS NOT NULL THEN TO_NUMBER(A.BOND_SEL_CD) || '차 채권매각'
											   WHEN A.END_TP = 'E' THEN '중도완납'
											   ELSE '중도해지'
										   END
				 ELSE '-'
			 END AS MFP_YN	/*완납/해지/채권*/
    FROM    RTSD0108 A,              /*장착정보T    */
            RTSD0100 B,              /*고객마스터T  */
            RTRE0020 D               /*고객카드정보T*/
    WHERE   A.CUST_NO  = B.CUST_NO
    AND     A.PAY_MTHD = 'C'
    AND     A.CUST_NO  = D.CUST_NO
    AND     A.CRD_SEQ  = D.CRD_SEQ
    --AND     D.USE_YN   = 'Y' -- 20151109 계좌/카드 사용중지으로 수정
    AND     A.ORD_NO IN (SELECT  ORD_NO
                         FROM    RTSD0108
                         WHERE   ORD_NO  = DECODE(v_Ord_No, NULL, ORD_NO, v_Ord_No)
                         AND     CUST_NO = DECODE(v_Cust_No, NULL, CUST_NO, v_Cust_No)
                         );

  END p_sRtre0050List;


  /*****************************************************************************
  -- 결제정보 삭제가능여부 (S:삭제가능/F:삭제불가/E:오류)
  *****************************************************************************/
  FUNCTION f_sDelete0050Tp (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE        /*계약번호      */
    ) RETURN VARCHAR IS
    v_Pdel_Tp RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL; /*삭제가능여부  */
  BEGIN

    SELECT  CASE
            WHEN (NVL (a.afcust_no, 0) = NVL (b.cust_no, 0)
                    AND NVL (a.afpay_mthd, 0) = NVL (b.pay_mthd, 0)
                    AND NVL (a.afpay_dd, 0) = NVL (b.pay_dd, 0)
                    AND NVL (a.afacc_seq, 0) = NVL (b.acc_seq, 0)
                    AND NVL (a.afcrd_seq, 0) = NVL (b.crd_seq, 0)
                    AND NVL (a.afbatch_key, 0) = NVL (b.batch_key, 0))
                    THEN
                CASE
                WHEN    a.rpc_cd = '04' AND    (a.bfacrq_st = '6' OR a.afacrq_st = '0') --변경사유('04:회사접수') AND 변경전 계좌해지 신청처리상태(R009'6:해지대상') OR 변경후 계좌신청처리상태(R009'0:신청대상')
                THEN
                    'S' --삭제가능
                ELSE
                    'F' --삭제불가
                END
            ELSE
                'E' --오류
            END
    INTO    v_Pdel_Tp
    FROM    RTRE0050 A,
            RTSD0108 B
    WHERE   A.ORD_NO  = B.ORD_NO
    AND     A.ORD_NO  = V_ORD_NO
    AND     A.RPC_SEQ = f_sRtre0050RpcSeq(v_Ord_No);

    RETURN v_Pdel_Tp;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sDelete0050Tp;

 /*****************************************************************************
  -- 결제정보 삭제
  *****************************************************************************/
  PROCEDURE p_DeleteRtre0050 (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*계약번호              */
    v_Del_Tp         IN RTRE0050.DEL_YN%TYPE,         /*삭제가능여부          */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*사용자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Bfcust_No   RTRE0050.BFCUST_NO%TYPE DEFAULT NULL;   /*변경전 고객번호       */
    v_BfPay_Mthd  RTRE0050.BFPAY_MTHD%TYPE DEFAULT NULL;  /*변경전결제방법        */
    v_Bfpay_Dd    RTRE0050.BFPAY_DD%TYPE DEFAULT NULL;    /*변경전결제일자        */
    v_Bfacc_Seq   RTRE0050.BFACC_SEQ%TYPE DEFAULT NULL;   /*변경전 계좌순번       */
    v_Bfcrd_Seq   RTRE0050.BFCRD_SEQ%TYPE DEFAULT NULL;   /*변경전 카드순번       */
    v_Acc_Chk     RTSD0108.ACC_CHK%TYPE DEFAULT NULL;     /*계좌확인상태          */
    v_Bfacc_Stat  RTRE0050.BFACC_STAT%TYPE DEFAULT NULL;  /*변경전 계좌신청상태   */
    v_Bkey_Chk    RTSD0108.BKEY_CHK%TYPE DEFAULT NULL;    /*카드확인상태          */
    v_Bfbatch_Key RTRE0050.BFBATCH_KEY%TYPE DEFAULT NULL; /*변경전 배치키         */
    e_Error EXCEPTION;
  BEGIN

    -- 필수값:주문번호, 삭제가능여부,  등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (Pkg_Rtre0050.f_sRtre0050RpcSeq(v_Ord_No) IS NULL) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Del_Tp != 'S' THEN
        v_Return_Message := '삭제가능여부(S)('||v_Del_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약번호로 변경전 계좌/카드 정보 획득
    SELECT  BFCUST_NO, BFPAY_MTHD, BFPAY_DD ,BFACC_SEQ, BFCRD_SEQ, BFACC_STAT, BFBATCH_KEY
    INTO    v_Bfcust_No, v_BfPay_Mthd ,v_BfPay_dd, v_Bfacc_Seq, v_Bfcrd_Seq, v_Bfacc_Stat, v_Bfbatch_Key
    FROM    RTRE0050 A
    WHERE   ORD_NO   = v_Ord_No
    AND     RPC_SEQ  = f_sRtre0050RpcSeq(v_Ord_No);

    IF v_Bfacc_Seq != '' THEN

        -- 계좌확인 상태 획득
        SELECT  ACC_CHK
        INTO    v_Acc_Chk
        FROM    RTRE0010
        WHERE   ACC_SEQ = v_Bfacc_Seq;

    ELSE
        v_Acc_Chk := 'N';
    END IF;


    IF v_Bfcrd_Seq != '' THEN

        -- 카드확인 상태 획득
        SELECT  BKEY_CHK
        INTO    v_Bkey_Chk
        FROM    RTRE0020
        WHERE   CRD_SEQ = v_Bfcrd_Seq;
    ELSE
        v_Bkey_Chk := 'N';
    END IF;

    -- 결제정보 변경이력 생성에 따른 변경
    IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108RpcInfoChange(v_Ord_No, v_BfPay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq,
                                                       v_Bfcrd_Seq, v_Acc_Chk, v_Bfacc_Stat, v_Bkey_Chk,
                                                       v_Bfbatch_Key, v_Reg_Id, v_ErrorText) THEN
         v_Return_Message := v_ErrorText;
         RAISE e_Error;
    END IF;

    -- 스케줄 Update - 결제정보 변경 또는 삭제시 해당 스케줄 내역(결제방법, 결제일, 만기계산기준일) 업데이트
    Pkg_Rtsd0109.p_UpdateRtsd0109(v_Ord_No, v_Bfcust_No, v_BfPay_Mthd, v_Bfpay_Dd,
                                  TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Reg_Id, v_Success_Code, v_Return_Message,
                                  v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '스케줄 Update 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;

    -- 결제정보 삭제
    IF 0 != f_DeleteTpRtre0050(v_Ord_No, v_Reg_Id, v_ErrorText) THEN
         v_Return_Message := '결제정보 삭제 실패(1)!!!'||'-'||v_ErrorText;
         RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 삭제되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0050.p_DeleteRtre0050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0050.p_DeleteRtre0050(2)', v_ErrorText, v_Return_Message);

  END p_DeleteRtre0050;

  /*****************************************************************************
  -- 결제정보 삭제 FUNCTION
  *****************************************************************************/
  FUNCTION f_DeleteTpRtre0050 (
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE,         /*계약번호               */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0050
    SET     DEL_YN  = 'Y',
            CHG_ID  = v_Reg_Id,
            CHG_DT  = SYSDATE
    WHERE   ORD_NO  = v_Ord_No
    AND     RPC_SEQ = f_sRtre0050RpcSeq(v_Ord_No);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteTpRtre0050;


  /*****************************************************************************
  -- 결제정보 변경이력 - 결제변경요청순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050RpcSeq RETURN NUMBER IS

    v_Rpc_Seq   RTRE0050.RPC_SEQ%TYPE DEFAULT NULL;        /*결제변경요청순번      */
  BEGIN


    SELECT  Seq_Rtre0050Rpc_Seq.NEXTVAL RPC_SEQ
    INTO    v_Rpc_Seq
    FROM    DUAL;

    RETURN v_Rpc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0050RpcSeq;


  /*****************************************************************************
  -- 결제정보 변경이력 - 주문번호 기준  최종변경이력의  변경전 계좌해지 신청 처리상태 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050FinalBfacrqSt(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*주문번호              */
    ) RETURN VARCHAR IS

    v_Bfacrq_St RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL; /*변경전 계좌해지 신청  */
  BEGIN

    SELECT  BFACRQ_ST
    INTO    v_Bfacrq_St
    FROM    RTRE0050
    WHERE   RPC_SEQ = f_sRtre0050RpcSeq(v_Ord_No);

    RETURN v_Bfacrq_St;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0050FinalBfacrqSt;

  /*****************************************************************************
  -- 결제정보 변경이력 - 주문번호 기준  최종변경이력의  변경후 계좌신청 처리상태
  *****************************************************************************/
  FUNCTION f_sRtre0050FinalAfacrqSt(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*주문번호              */
    ) RETURN VARCHAR IS

    v_Afacrq_St RTRE0050.AFACRQ_ST%TYPE DEFAULT NULL; /*변경후 계좌신청 처리상*/
  BEGIN

    SELECT  AFACRQ_ST
    INTO    v_Afacrq_St
    FROM    RTRE0050
    WHERE   RPC_SEQ = f_sRtre0050RpcSeq(v_Ord_No);

    RETURN v_Afacrq_St;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0050FinalAfacrqSt;


  /*****************************************************************************
  -- 결제정보 변경이력 - 변경전 계좌해지 신청 처리상태 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050BfacrqSt(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Bfpay_Mthd     IN RTRE0050.BFPAY_MTHD%TYPE,     /*변경전 결제방법       */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_RpcAcc_Yn      IN RTRE0050.DEL_YN%TYPE,         /*결제계좌 변경여부     */
    v_RpcDay_Yn      IN RTRE0050.DEL_YN%TYPE          /*결제일 변경여부       */
    ) RETURN VARCHAR IS

    v_Bfacrq_St      RTRE0050.BFACRQ_ST%TYPE;      /*변경전 계좌해지 신청  */
  BEGIN

    IF v_Rpc_Cd = '01' THEN -- 장착확정

        v_Bfacrq_St := NULL;

    ELSIF v_Rpc_Cd = '02' THEN -- 은행접수 해지

        IF v_Bfpay_Mthd = 'A' AND v_Bfacc_Stat = '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN
            v_Bfacrq_St := '5';
        ELSE
            v_Bfacrq_St := 'E';
        END IF;

    ELSIF v_Rpc_Cd = '03' THEN -- 은행접수 신청

        IF    v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '6';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd <> 'A' THEN v_Bfacrq_St := '5';
        ELSE  v_Bfacrq_St := 'E'; END IF;


    ELSIF v_Rpc_Cd = '04' THEN -- 회사접수

        IF    v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '6';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '6';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5'; -- 2016-08-10 이영근, 변경전 계좌가 비정상일때 예외처리 
        ELSIF v_Bfpay_Mthd <> 'A' THEN v_Bfacrq_St := '5';
        ELSE  v_Bfacrq_St := 'E'; END IF;


    ELSIF v_Rpc_Cd = '05' THEN -- 양도양수

        IF    v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '6';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '6';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat <> '4' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'Y' THEN v_Bfacrq_St := '5';
        ELSIF v_Bfpay_Mthd <> 'A' THEN v_Bfacrq_St := '5';
        ELSE  v_Bfacrq_St := 'E'; END IF;


    ELSIF v_Rpc_Cd = '06' THEN -- 은행임의 해지

        IF    v_Bfpay_Mthd =  'A' AND v_Bfacc_Stat =  '4' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN v_Bfacrq_St := '5';
        ELSE  v_Bfacrq_St := 'E'; END IF;

    ELSE

        v_Bfacrq_St := 'E';

    END IF;

    RETURN v_Bfacrq_St;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 'E';

  END f_sRtre0050BfacrqSt;

  /*****************************************************************************
  -- 결제정보 변경이력 - 변경후 계좌신청 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050AfaccStat(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,         /*변경사유코드          */
    v_Afpay_Mthd     IN RTRE0050.AFPAY_MTHD%TYPE,     /*변경후 결제방법       */
    v_RpcAcc_Yn      IN RTRE0050.DEL_YN%TYPE,         /*결제계좌 변경여부     */
    v_RpcDay_Yn      IN RTRE0050.DEL_YN%TYPE,         /*결제일 변경여부       */
    v_Bfacc_Stat     IN RTRE0050.BFACC_STAT%TYPE,     /*변경전 계좌신청상태   */
    v_Afacc_Stat     OUT RTRE0050.AFACC_STAT%TYPE,    /*변경후 계좌신청 상태  */
    v_Afacrq_St      OUT RTRE0050.AFACRQ_ST%TYPE      /*변경후 계좌신청 처리상*/
    ) RETURN NUMBER IS

  BEGIN

    IF v_Rpc_Cd = '01' THEN -- 장착확정

        IF  v_Afpay_Mthd = 'A' THEN
            v_Afacc_Stat := '0';
            v_Afacrq_St := '0';
            RETURN 0;
        ELSIF v_Afpay_Mthd <> 'A' THEN
            v_Afacc_Stat := '5';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;

    ELSIF v_Rpc_Cd = '02' THEN -- 은행접수 해지

        IF  v_Afpay_Mthd = 'A' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '3';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSIF v_Afpay_Mthd <> 'A' THEN
            v_Afacc_Stat := '5';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;

    ELSIF v_Rpc_Cd = '03' THEN -- 은행접수 신청

        IF  v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '4';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSIF v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '4';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSIF v_Afpay_Mthd <> 'A' THEN
            v_Afacc_Stat := '5';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;


    ELSIF v_Rpc_Cd = '04' THEN -- 회사접수

        IF  v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'Y' THEN
            v_Afacc_Stat := v_Bfacc_Stat; -- 변경전 계좌신청 상태 동일(승계)
            v_Afacrq_St := '5';
            RETURN 0;
        ELSIF v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '0';
            v_Afacrq_St := '0';
            RETURN 0;
        ELSIF v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'Y' THEN
            v_Afacc_Stat := '0';
            v_Afacrq_St := '0';
            RETURN 0;
        ELSIF v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '0';
            v_Afacrq_St := '0';
            RETURN 0;   -- 2016-08-10 이영근, 이전 계좌가 비정상시 처리         
        ELSIF v_Afpay_Mthd <> 'A' THEN
            v_Afacc_Stat := '5';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;


    ELSIF v_Rpc_Cd = '05' THEN -- 양도양수

        IF  v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '0';
            v_Afacrq_St := '0';
            RETURN 0;
        ELSIF v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'Y' AND v_RpcDay_Yn = 'Y' THEN
            v_Afacc_Stat := '0';
            v_Afacrq_St := '0';
            RETURN 0;
        ELSIF v_Afpay_Mthd <> 'A' THEN
            v_Afacc_Stat := '5';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;

    ELSIF v_Rpc_Cd = '06' THEN -- 은행임의 해지

        IF  v_Afpay_Mthd =  'A' AND v_RpcAcc_Yn = 'N' AND v_RpcDay_Yn = 'N' THEN
            v_Afacc_Stat := '9';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSIF v_Afpay_Mthd <> 'A' THEN
            v_Afacc_Stat := '5';
            v_Afacrq_St := '5';
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;

    ELSE

        RETURN -1;

    END IF;

    RETURN 0;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN -1;

  END f_sRtre0050AfaccStat;


  /*****************************************************************************
  -- 결제정보 변경이력 - 변경후 계좌신청 발생구분/처리일/순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050AfacrqFgDaySeq(
    v_Rpc_Cd         IN RTRE0050.RPC_CD%TYPE,          /*변경사유코드          */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*계좌신청 처리일       */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,        /*계좌신청 순번         */
    v_Afacrq_Fg      OUT RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     OUT RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     OUT RTRE0050.AFACRQ_SEQ%TYPE      /*변경후 계좌신청 순번  */
    ) RETURN NUMBER IS

  BEGIN

    IF v_Rpc_Cd = '01' THEN -- 장착확정

        v_Afacrq_Fg  := NULL;
        v_Afacrq_Day := NULL;
        v_Afacrq_Seq := NULL;
        RETURN 0;

    ELSIF v_Rpc_Cd = '02' THEN -- 은행접수 해지

        v_Afacrq_Fg  := 'B';
        v_Afacrq_Day := v_Acrq_Day;
        v_Afacrq_Seq := v_Acrq_Seq;
        RETURN 0;

    ELSIF v_Rpc_Cd = '03' THEN -- 은행접수 신청

        v_Afacrq_Fg  := 'B';
        v_Afacrq_Day := v_Acrq_Day;
        v_Afacrq_Seq := v_Acrq_Seq;
        RETURN 0;

    ELSIF v_Rpc_Cd = '04' THEN -- 회사접수

        v_Afacrq_Fg  := NULL;
        v_Afacrq_Day := NULL;
        v_Afacrq_Seq := NULL;
        RETURN 0;

    ELSIF v_Rpc_Cd = '05' THEN -- 양도양수

        v_Afacrq_Fg  := NULL;
        v_Afacrq_Day := NULL;
        v_Afacrq_Seq := NULL;
        RETURN 0;

    ELSIF v_Rpc_Cd = '06' THEN -- 은행임의 해지

        v_Afacrq_Fg  := 'B';
        v_Afacrq_Day := v_Acrq_Day;
        v_Afacrq_Seq := v_Acrq_Seq;
        RETURN 0;

    ELSE

        RETURN -1;

    END IF;


    EXCEPTION
      WHEN OTHERS THEN
        RETURN -1;

  END f_sRtre0050AfacrqFgDaySeq;

  /*****************************************************************************
  -- 결제정보 변경이력 - 계약번호 기준 삭제되지 않은 결제변경요청순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0050RpcSeq(
    v_Ord_No         IN RTRE0050.ORD_NO%TYPE          /*계약번호               */
    ) RETURN NUMBER IS
    v_Rpc_Seq   RTRE0050.RPC_SEQ%TYPE DEFAULT NULL;      /*결제변경요청순번    */
  BEGIN

    SELECT  MAX(RPC_SEQ)
    INTO    v_Rpc_Seq
    FROM    RTRE0050
    WHERE   ORD_NO = v_Ord_No
    AND     DEL_YN = 'N';

    RETURN v_Rpc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0050RpcSeq;

  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌해지건 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050Terminate (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Bfacrq_Fg      IN RTRE0050.BFACRQ_FG%TYPE,      /*변경전 계좌신청 발생구*/
    v_Bfacrq_Day     IN RTRE0050.BFACRQ_DAY%TYPE,     /*변경전 계좌해지 신청  */
    v_Bfacrq_Seq     IN RTRE0050.BFACRQ_SEQ%TYPE,     /*변경전 계좌해지 신청  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0050
    SET    BFACRQ_FG  = v_Bfacrq_Fg,
           BFACRQ_DAY = v_Bfacrq_Day,
           BFACRQ_SEQ = v_Bfacrq_Seq,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RPC_SEQ    = v_Rpc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0050Terminate;


  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌신청건 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050Application (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Afacrq_Fg      IN RTRE0050.AFACRQ_FG%TYPE,      /*변경후 계좌신청 발생구*/
    v_Afacrq_Day     IN RTRE0050.AFACRQ_DAY%TYPE,     /*변경후 계좌신청 처리일*/
    v_Afacrq_Seq     IN RTRE0050.AFACRQ_SEQ%TYPE,     /*변경후 계좌신청 순번  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0050
    SET    AFACRQ_FG  = v_Afacrq_Fg,
           AFACRQ_DAY = v_Afacrq_Day,
           AFACRQ_SEQ = v_Afacrq_Seq,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RPC_SEQ    = v_Rpc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0050Application;


  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌신청 결과처리 상태값(변경후) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050AfterResult (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Afacc_Stat     IN RTRE0050.AFACC_STAT%TYPE,     /*변경후 계좌신청 상태  */
    v_Afacrq_St      IN RTRE0050.AFACRQ_ST%TYPE,      /*변경후 계좌신청 처리상*/
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0050
    SET    AFACC_STAT = v_Afacc_Stat,
           AFACRQ_ST  = v_Afacrq_St,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RPC_SEQ    = v_Rpc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0050AfterResult;


  /*****************************************************************************
  -- 결제정보 변경이력 - 계좌신청 결과처리 상태값(변경후)  Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0050BeforeResult (
    v_Rpc_Seq        IN RTRE0050.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Bfacrq_St      IN RTRE0050.BFACRQ_ST%TYPE,      /*변경전 계좌해지 신청  */
    v_Reg_Id         IN RTRE0050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0050
    SET    BFACRQ_ST  = v_Bfacrq_St,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RPC_SEQ    = v_Rpc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0050BeforeResult;

END Pkg_Rtre0050;