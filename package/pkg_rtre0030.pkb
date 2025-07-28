CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0030 AS
/*******************************************************************************
   NAME      Pkg_Rtre0030
   PURPOSE   수납 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
   1.1        2015-10-16  jemcarry         1.p_InsertRtre0030 수납내역(RTRE0030) 거래일련번호와
                                             선수금발생내역(RTRE0035) 거래일련번호를 동일하게 되도록 변경
   1.2        2016-10-23  wjim             수납작업자 제한
   1.2.1      2016-12-06  wjim             [20161206_01] 수납작업자 변경
   1.3        2017-10-18  wjim             [20170224_01] 가상계좌 개발에 따른 작업
   1.4        2018-05-30  wjim             [20180530_01] RPA 로봇 수납작업 권한 부여

*******************************************************************************/

  /*****************************************************************************
  -- 수납 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0030Count(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0030
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0030Count;

  /*****************************************************************************
  -- 수납 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_ID,                   /*수납자ID            */
            A.RECP_AMT,                  /*수납금액            */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CASH_YN,                   /*현금영수증 발행여부 */
            A.CNC_STAT,                  /*수납취소여부        */
            A.CNC_RSEQ,                  /*수납취소거래번호    */
            A.CNC_ISEQ,                  /*수납취소거래일련번호*/
            A.CNC_IOSEQ,                 /*수납취소거래번호종료*/
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0030 A
    WHERE   A.RECV_SEQ = DECODE(v_Recv_Seq , NULL, A.RECV_SEQ , v_Recv_Seq)
    AND     A.RITM_SEQ = DECODE(v_Ritm_Seq , NULL, A.RITM_SEQ , v_Ritm_Seq)
    AND     A.RECV_DAY = DECODE(v_Recv_Day , NULL, A.RECV_DAY , v_Recv_Day)
    AND     A.ORD_NO   = DECODE(v_Ord_No   , NULL, A.ORD_NO   , v_Ord_No)
    AND     A.CUST_NO  = DECODE(v_Cust_No  , NULL, A.CUST_NO  , v_Cust_No)
    AND     A.RECP_ID  = DECODE(v_Recp_Id  , NULL, A.RECP_ID  , v_Recp_Id)
    AND     A.RECP_AMT = DECODE(v_Recp_Amt , NULL, A.RECP_AMT , v_Recp_Amt)
    AND     A.RECP_TP  = DECODE(v_Recp_Tp  , NULL, A.RECP_TP  , v_Recp_Tp)
    AND     A.RECP_PAY = DECODE(v_Recp_Pay , NULL, A.RECP_PAY , v_Recp_Pay)
    AND     A.RECP_FG  = DECODE(v_Recp_Fg  , NULL, A.RECP_FG  , v_Recp_Fg)
    AND     A.SCHD_SEQ = DECODE(v_Schd_Seq , NULL, A.SCHD_SEQ , v_Schd_Seq)
    AND     A.CASH_YN  = DECODE(v_Cash_Yn  , NULL, A.CASH_YN  , v_Cash_Yn)
    AND     A.CNC_STAT = DECODE(v_Cnc_Stat , NULL, A.CNC_STAT , v_Cnc_Stat)
    AND     A.CNC_RSEQ = DECODE(v_Cnc_Rseq , NULL, A.CNC_RSEQ , v_Cnc_Rseq)
    AND     A.CNC_ISEQ = DECODE(v_Cnc_Iseq , NULL, A.CNC_ISEQ , v_Cnc_Iseq)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0030;

  /*****************************************************************************
  -- 수납 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0030 (
            RECV_SEQ,
            RITM_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_ID,
            RECP_AMT,
            RECP_TP,
            RECP_PAY,
            RECP_FG,
            SCHD_SEQ,
            CASH_YN,
            CNC_STAT,
            CNC_RSEQ,
            CNC_ISEQ,
            CNC_IOSEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Ritm_Seq,
            v_Recv_Day,
            v_Ord_No,
            v_Cust_No,
            v_Recp_Id,
            v_Recp_Amt,
            v_Recp_Tp,
            v_Recp_Pay,
            v_Recp_Fg,
            v_Schd_Seq,
            v_Cash_Yn,
            v_Cnc_Stat,
            v_Cnc_Rseq,
            v_Cnc_Iseq,
            v_Cnc_Ioseq,
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

  END f_InsertRtre0030;

  /*****************************************************************************
  -- 수납 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0030
    SET    RECV_DAY  = v_Recv_Day,
           ORD_NO    = v_Ord_No,
           CUST_NO   = v_Cust_No,
           RECP_ID   = v_Recp_Id,
           RECP_AMT  = v_Recp_Amt,
           RECP_TP   = v_Recp_Tp,
           RECP_PAY  = v_Recp_Pay,
           RECP_FG   = v_Recp_Fg,
           SCHD_SEQ  = v_Schd_Seq,
           CASH_YN   = v_Cash_Yn,
           CNC_STAT  = v_Cnc_Stat,
           CNC_RSEQ  = v_Cnc_Rseq,
           CNC_ISEQ  = v_Cnc_Iseq,
           CNC_IOSEQ = v_Cnc_Ioseq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  RECV_SEQ  = v_Recv_Seq
    AND    RITM_SEQ  = v_Ritm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0030;

  /*****************************************************************************
  -- 수납 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0030
    WHERE  RECV_SEQ  = v_Recv_Seq
    AND    RITM_SEQ  = v_Ritm_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.f_DeleteRtre0030(1)', '수납거래번호', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.f_DeleteRtre0030(1)', '거래일련번호', v_Ritm_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.f_DeleteRtre0030(1)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0030;

  /*****************************************************************************
  -- 수납 내역 관리 - 수납등록처리:수납내역생성처리
  -- 1.2        2016-10-23  wjim             수납작업자 제한
  -- 1.2.1      2016-12-06  wjim             [20161206_01] 수납작업자 변경
  --                                         - 김화연 제외
  --                                         - 김선태, 김혜련 추가
     1.3        2017-10-18  wjim             [20170224_01] 가상계좌 개발에 다른 수납작업자 추가
                                             - KCP 가상계좌 입금통보용 사용자(KCP_NOTI)
     1.4        2018-05-30  wjim             [20180530_01] RPA 로봇 수납작업 권한 부여                                          
                                             
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Rear_Amt       NUMBER,                          /*미납수납금액          */
    v_Pnd_Amt        NUMBER,                          /*선수금수납금액        */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    TYPE p_CUR_Type IS RECORD (
        ORD_NO      RTSD0109.ORD_NO%TYPE,      /*계약번호 */
        CUST_NO     RTSD0109.CUST_NO%TYPE,     /*고객번호 */
        SCHD_SEQ    RTSD0109.SCHD_SEQ%TYPE,    /*청구순번 */
        ARRE_AMT    RTSD0109.ARRE_AMT%TYPE,    /*미납금액 */
        RECP_AMT    RTSD0109.RECP_AMT%TYPE     /*수납금액 */
        );

    CUR p_CUR_Type;

    v_Ritm_Seq  RTRE0030.RITM_SEQ%TYPE DEFAULT NULL;  /*거래일련번호          */
    v_Recp_Tp   RTRE0030.RECP_TP%TYPE DEFAULT NULL;   /*청구구분              */
    v_Schd_Seq  RTRE0030.SCHD_SEQ%TYPE DEFAULT NULL;  /*스케줄순번            */
    v_Cash_Yn   RTRE0030.CASH_YN%TYPE DEFAULT 'N';    /*현금영수증 발행여부   */
    v_Cnc_Stat  RTRE0030.CNC_STAT%TYPE DEFAULT 'N';   /*수납취소여부          */
    v_Cnc_Rseq  RTRE0030.CNC_RSEQ%TYPE DEFAULT NULL;  /*수납취소거래번호      */
    v_Cnc_Iseq  RTRE0030.CNC_ISEQ%TYPE DEFAULT NULL;  /*수납취소거래일련번호  */
    v_Cnc_Ioseq RTRE0030.CNC_IOSEQ%TYPE DEFAULT NULL; /*수납취소거래번호 종료 */
    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE DEFAULT 'P';   /*선수금상태            */


    v_Recp_Tp_B  RTSD0109.RECP_TP%TYPE DEFAULT NULL;  /*청구구분              */
    v_Recp_Amt_B RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_B RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_B RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */
    v_Zfb_Day_B  RTSD0109.ZFB_DAY%TYPE DEFAULT NULL;  /*만기계산기준일        */

    v_Rc_Yn_A    RTSD0109.RC_YN%TYPE DEFAULT NULL;    /*수납여부              */
    v_Recp_Amt_A RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_A RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_A RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */

    e_Error EXCEPTION;
    v_Tdata_Cnt NUMBER DEFAULT 0;
    v_Rear_Cnt  NUMBER DEFAULT 0;
    v_Pnd_Cnt   NUMBER DEFAULT 0;

    v_Recp_TAmt NUMBER DEFAULT 0;               /*수납금액합계          */
    v_Rear_TAmt NUMBER DEFAULT 0;               /*미납수납금액합계      */
    v_Pnd_TAmt  NUMBER DEFAULT 0;               /*선수금수납금액합계    */

    v_Rear_9Amt NUMBER DEFAULT 0;               /*미납수납금액          */
    v_Pnd_9Amt  NUMBER DEFAULT 0;               /*선수금수납금액        */

  BEGIN

    -- 필수값: 수납일자,계약번호,고객번호,수납자ID,수납금액,수납방법,수납거래번호,미납수납금액,선수금수납금액, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN

        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
            v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recp_Pay) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R019', v_Recp_Pay)) THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    -- 수납작업 권한 확인
    -- - [20170224_01] 에 의해 'KCP_NOTI' 추가
        -- - [20180530_01] 'rpa01', 'rpa02', 'rpa03' 추가
    -- 오픈 후 상담실이나 추심업체 수납업무 가능으로 인해 임시로 권한 풀엊둠 (임준호 : 20190207)    
--    IF TRIM(v_Reg_Id) NOT IN ('ONL_SYS', 'wjim', '10150029', 'kstka', '10160046', 'KCP_NOTI', 'rpa01', 'rpa02', 'rpa03', 'uracle01','100266') THEN
--
--        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 수납작업 권한이 없는 사용자입니다!';
--        RAISE e_Error;
--    END IF;

    IF TRIM(v_Rear_Amt) IS NULL THEN
        v_Return_Message := '미납수납금액('||v_Rear_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Pnd_Amt) IS NULL THEN
        v_Return_Message := '선수금수납금액('||v_Pnd_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Recp_Amt != (v_Rear_Amt + v_Pnd_Amt) THEN
        v_Return_Message := '미납수납금액('||v_Rear_Amt||')과 선수금수납금액('||v_Pnd_Amt||')의 합이 수납금액('||v_Recp_Amt||')과 일치하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 데이터 검증 + 데이터 등록
    LOOP
        FETCH  Ref_Cursor INTO CUR;
        EXIT WHEN Ref_Cursor%NOTFOUND;
        v_Rear_Cnt := v_Rear_Cnt+1;

        v_Recp_TAmt := v_Recp_TAmt + NVL(CUR.RECP_AMT, 0);  /*수납처리금액 합계*/

        -- 미납급액 존재할 경우 (CURSOR에 대상이 존재하는 경우)
        IF TRIM(CUR.SCHD_SEQ) IS NOT NULL THEN  -- 선수금은 청구순번이 없음

            -- 1) 스케줄상 미납금액이 같은지 체크한다. 다른 경우 수납처리 불가
            SELECT  NVL(ARRE_AMT,0)
            INTO    v_Rear_9Amt
            FROM    RTSD0109
            WHERE   ORD_NO   = CUR.ORD_NO
            AND     SCHD_SEQ = CUR.SCHD_SEQ;

            IF SQL%NOTFOUND THEN
                v_Return_Message := '리스트의 계약번호('||CUR.ORD_NO||')와 청구순번('||CUR.SCHD_SEQ||')으로 청구스케쥴을 찾을 수 없습니다. 처리 불가!';
                RAISE e_Error;
            END IF;

            IF NVL(v_Rear_9Amt,0) != NVL(CUR.ARRE_AMT,0) THEN
                v_Return_Message := '스케쥴상('||CUR.SCHD_SEQ||')의 미납금액('||v_Rear_9Amt||')과 입력된 미납금액('||CUR.ARRE_AMT||')이 다르므로 처리가 불가합니다.!';
                RAISE e_Error;
            END IF;

            IF NVL(CUR.ARRE_AMT,0) < NVL(CUR.RECP_AMT,0) THEN
                v_Return_Message := '리스트의 미납금액('||CUR.ARRE_AMT||')이 수납처리금액('||CUR.RECP_AMT||') 보다는 작을 수 없어 처리가 불가합니다.!';
                RAISE e_Error;
            END IF;

            v_Rear_TAmt := v_Rear_TAmt + NVL(CUR.RECP_AMT, 0); /*미납수납금액합계*/
        ELSE
            v_Pnd_Cnt := v_Pnd_Cnt + 1;

            IF 1 < NVL(v_Pnd_Cnt,0) THEN
                v_Return_Message := '리스트상에 선수금은 한 건 이상일 수 없음으로 처리가 불가합니다.!';
                RAISE e_Error;
            END IF;
            v_Pnd_TAmt  := v_Pnd_TAmt + NVL(CUR.RECP_AMT, 0);  /*선수금수납금액합계*/
        END IF;


        v_Ritm_Seq := f_sRtre0030RitmSeq(v_Recv_Seq);

        -- 수납금액 > 0 AND 미납금액 > 0 AND 수납금액 < = 미납금액  : 미수금 수납
        IF (NVL(CUR.RECP_AMT,0) > 0) AND
           (NVL(CUR.ARRE_AMT,0) > 0) AND
           (NVL(CUR.RECP_AMT,0) <= NVL(CUR.ARRE_AMT,0)) THEN


            -- 청구 스케줄 청구구분, 수납금액, 매출금액, 연체금액(미납금액), 만기계산기준일 획득
            SELECT  RECP_TP, NVL(RECP_AMT,0), NVL(SALE_AMT,0), NVL(ARRE_AMT,0), ZFB_DAY
            INTO    v_Recp_Tp_B, v_Recp_Amt_B, v_Sale_Amt_B, v_Arre_Amt_B, v_Zfb_Day_B
            FROM    RTSD0109
            WHERE   ORD_NO   = CUR.ORD_NO
            AND     SCHD_SEQ = CUR.SCHD_SEQ;

            IF SQL%NOTFOUND THEN
                v_Return_Message := '리스트의 계약번호('||CUR.ORD_NO||')와 청구순번('||CUR.SCHD_SEQ||')으로 청구스케쥴을 찾을 수 없습니다. 처리 불가!';
                RAISE e_Error;
            END IF;

            -- 수납 내역 생성
            IF 0 != f_InsertRtre0030(v_Recv_Seq, v_Ritm_Seq, v_Recv_Day, CUR.ORD_NO,
                                     CUR.CUST_NO, v_Recp_Id, CUR.RECP_AMT, v_Recp_Tp_B,
                                     v_Recp_Pay, v_Recp_Fg, CUR.SCHD_SEQ, v_Cash_Yn,
                                     v_Cnc_Stat, v_Cnc_Rseq, v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '수납(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 수납 대상 내역 생성
            Pkg_Rtre0031.p_IUDRtre0031 ('I', v_Recv_Seq, v_Ritm_Seq, v_Recv_Day,
                                        CUR.ORD_NO, CUR.SCHD_SEQ, CUR.CUST_NO, v_Recp_Tp_B,
                                        v_Sale_Amt_B, v_Arre_Amt_B, v_Zfb_Day_B, v_Reg_Id,
                                        v_Success_Code, v_Return_Message, v_ErrorText);

            IF 0 != v_Success_Code THEN
                v_Return_Message := '수납 대상 내역(미수금) 생성 실패!!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 수납금액: 기존수납금액 + 현재수납금액
            v_Recp_Amt_A := NVL(v_Recp_Amt_B,0) + NVL(CUR.RECP_AMT,0);

            -- 연체금액(미납금액) : 매출액 - 수납금액
            v_Arre_Amt_A := NVL(v_Sale_Amt_B,0) - v_Recp_Amt_A;

            -- 기존수납금액 + 현재수납금액 = 매출액
            IF v_Recp_Amt_A  = NVL(v_Sale_Amt_B,0) THEN
                v_Rc_Yn_A := 'Y';

            -- 기존수납금액 + 현재수납금액 < 매출액
            ELSIF (v_Recp_Amt_A > 0) AND (v_Recp_Amt_A < NVL(v_Sale_Amt_B,0)) THEN
                v_Rc_Yn_A := 'P';

            -- 기존수납금액 + 현재수납금액 = 0
            ELSIF v_Recp_Amt_A = 0 THEN
                v_Rc_Yn_A := 'N';

            --  기존수납금액 + 현재수납금액 > 매출액
            ELSIF v_Recp_Amt_A > NVL(v_Sale_Amt_B,0) THEN
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 보다 수납금액('||v_Recp_Amt_A||')이 크므로 처리가 불가합니다!!';
                RAISE e_Error;
            ELSE
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 또는 수납금액('||v_Recp_Amt_A||')의 문제로 처리가 불가합니다!!';
                RAISE e_Error;
            END IF;

            -- 청구스케줄 Update - 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자)
            IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109ReceiptState (CUR.ORD_NO, CUR.SCHD_SEQ, v_Rc_Yn_A, v_Recp_Amt_A,
                                                               v_Arre_Amt_A, v_Recv_Day, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자) 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        -- 1) 수납금액 > 0 AND 미납금액 = 0 : 선수금 처리
        ELSIF (NVL(CUR.RECP_AMT,0) > 0) AND
              (NVL(CUR.ARRE_AMT,0) = 0) THEN


            v_Recp_Tp := '90'; /*청구구분 : 선수금(90) */

            -- 수납 내역 생성
            IF 0 != f_InsertRtre0030(v_Recv_Seq, v_Ritm_Seq, v_Recv_Day, CUR.ORD_NO,
                                     CUR.CUST_NO, v_Recp_Id, CUR.RECP_AMT, v_Recp_Tp,
                                     v_Recp_Pay, v_Recp_Fg, CUR.SCHD_SEQ, v_Cash_Yn,
                                     v_Cnc_Stat, v_Cnc_Rseq, v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '수납(선수금) 내역(RTRE0030) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 선수금 발생내역 등록
            IF 0 != Pkg_Rtre0035.f_InsertRtre0035 (v_Recv_Seq, v_Ritm_Seq, v_Recv_Day,
                                        CUR.ORD_NO, CUR.CUST_NO, CUR.RECP_AMT, 0,
                                        v_Recp_Tp, v_Recp_Pay, v_Recp_Fg, v_Pnd_Stat,
                                        v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '선수금 발생내역(RTRE0035) 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '리스트의 수납금액('||CUR.RECP_AMT||')과 미납금액('||CUR.ARRE_AMT||')으로 선수금/미수금 구분이 불가하여 처리가 불가 합니다.!';
            RAISE e_Error;

        END IF;

    END LOOP;

    IF NVL(v_Recp_TAmt,0) != NVL(v_Recp_Amt,0) THEN
        v_Return_Message := '리스트의 수납처리금액합계('||v_Recp_TAmt||')과 입력된 수납금액('||v_Recp_Amt||')이 다르므로 처리가 불가합니다.!';
        RAISE e_Error;
    END IF;

    IF NVL(v_Rear_TAmt,0) != NVL(v_Rear_Amt,0) THEN
        v_Return_Message := '리스트의 미납금액합계('||v_Rear_TAmt||')과 입력된 미납수납금액('||v_Rear_Amt||')이 다르므로 처리가 불가합니다.!';
        RAISE e_Error;
    END IF;

    IF NVL(v_Pnd_TAmt,0) != NVL(v_Pnd_Amt,0) THEN
        v_Return_Message := '리스트의 선수금(수납처리금액)('||v_Pnd_TAmt||')과 입력된 선수금수납금액('||v_Pnd_Amt||')이 다르므로 처리가 불가합니다.!';
        RAISE e_Error;
    END IF;

    IF Ref_Cursor%ISOPEN THEN
        CLOSE Ref_Cursor;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0030;

  /*****************************************************************************
  -- 수납 내역 관리 - 수납취소처리:수납내역생성처리
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030Cancel (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 수납내역
    CURSOR  CUR_RTRE0030 IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_ID,                   /*수납자ID            */
            A.RECP_AMT,                  /*수납금액            */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CASH_YN,                   /*현금영수증 발행여부 */
            A.CNC_STAT,                  /*수납취소여부        */
            A.CNC_RSEQ,                  /*수납취소거래번호    */
            A.CNC_ISEQ,                  /*수납취소거래일련번호*/
            A.CNC_IOSEQ                  /*수납취소거래번호종료*/
    FROM    RTRE0030 A
    WHERE   A.RECV_SEQ = v_Recv_Seq
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;

    -- 추가 선수금 내역
    CURSOR  CUR_RTRE0035 IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.PND_DAY,                   /*선수 발생일자       */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.PND_AMT,                   /*선수 발생금액       */
            A.SBS_AMT,                   /*선수 정리금액       */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.PND_STAT                   /*선수금상태          */
    FROM    RTRE0035 A
    WHERE   A.RECV_SEQ  <> v_Recv_Seq
    AND     A.ORD_NO   = v_Ord_No
    AND     A.CUST_NO  = v_Cust_No
    AND     (A.PND_AMT - A.SBS_AMT) > 0
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;

    e_Error EXCEPTION;

    v_Recp_Fg   RTRE0030.RECP_FG%TYPE DEFAULT '11';   /*수납유형              */
    v_Cnc_Stat  RTRE0030.CNC_STAT%TYPE DEFAULT 'Y';   /*수납취소여부          */
    v_Cnc_Iseq  RTRE0030.CNC_ISEQ%TYPE DEFAULT NULL;  /*수납취소거래일련번호  */
    v_Cnc_Ioseq RTRE0030.CNC_IOSEQ%TYPE DEFAULT NULL; /*수납취소거래번호 종료 */
    v_Recp_Pay  RTRE0030.RECP_PAY%TYPE DEFAULT NULL; /*수납방법 */  -- 신규추가

    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE DEFAULT NULL;  /*선수금상태            */

    v_BalanceAmt   NUMBER DEFAULT 0; -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산)
    v_RecpAmtSum   NUMBER DEFAULT 0; -- 수납거래번호로 선수금(RTRE0030) 합계

    v_BalanceAmt2  NUMBER DEFAULT 0; -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산)
    v_BalanceAmt3  NUMBER DEFAULT 0;

    v_RecpAAA_Amt NUMBER DEFAULT 0;
    v_RecpBBB_Amt NUMBER DEFAULT 0;

    v_Recp_Tp_B  RTSD0109.RECP_TP%TYPE DEFAULT NULL;  /*청구구분              */
    v_Recp_Amt_B RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_B RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_B RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */
    v_Zfb_Day_B  RTSD0109.ZFB_DAY%TYPE DEFAULT NULL;  /*만기계산기준일        */

    v_Rc_Yn_A    RTSD0109.RC_YN%TYPE DEFAULT NULL;    /*수납여부              */
    v_Recp_Amt_A RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_A RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_A RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */


    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
  BEGIN

    -- 필수값:  수납일자, 수납거래번호, 계약번호, 고객번호, 수납취소거래번호, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No))THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cnc_Rseq) IS NULL THEN
        v_Return_Message := '수납취소거래번호('||v_Cnc_Rseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN

        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
            v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산) 획득
    v_BalanceAmt := Pkg_Rtre0035.f_sRtre0035BalanceAmt(v_Ord_No, v_Cust_No);

    -- 수납거래번호로 선수금(RTRE0030) 합계 획득
    v_RecpAmtSum := Pkg_Rtre0030.f_sRtre0030RecpAmtSum(v_Recv_Seq);

    -- 선수금 잔액 확인하여 취소금액보다 큰경우 취소 가능
    -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산) < 수납거래번호로 선수금(RTRE0030) 합계
    IF v_BalanceAmt < v_RecpAmtSum THEN
        v_Return_Message := '취소금액이 선수금 잔액보다 크므로 처리가 불가능합니다.확인 바랍니다.!';
        RAISE e_Error;
    END IF;


    -- 수납거래번호 기준 취소처리
    FOR CUR30 IN CUR_RTRE0030 LOOP
        EXIT WHEN CUR_RTRE0030%NOTFOUND;
        v_exist := TRUE;

        -- 미수금 : 수납내역(RTRE0030)의 스케쥴번호(SCHD_SEQ)가 존재하는 미수금수납 처리
        IF CUR30.SCHD_SEQ IS NOT NULL THEN

            -- 수납취소거래일련번호 획득
            v_Cnc_Iseq := f_sRtre0030RitmSeq(v_Cnc_Rseq);

            -- 수납취소거래일련번호종료 = 수납취소거래일련번호
            v_Cnc_Ioseq := v_Cnc_Iseq;

            -- 수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트
            IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq,
                                                            v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 수납 내역(RTRE0030) 생성 (-)
            IF 0 != f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                     CUR30.CUST_NO, CUR30.RECP_ID, - CUR30.RECP_AMT, CUR30.RECP_TP,
                                     CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN,
                                     v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '수납취소(미수금) 수납 내역(RTRE0030) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- 청구 스케줄 :  청구구분, 수납금액, 매출금액, 연체금액(미납금액), 만기계산기준일 획득
            SELECT  RECP_TP, NVL(RECP_AMT,0), NVL(SALE_AMT,0), NVL(ARRE_AMT,0), ZFB_DAY
            INTO    v_Recp_Tp_B, v_Recp_Amt_B, v_Sale_Amt_B, v_Arre_Amt_B, v_Zfb_Day_B
            FROM    RTSD0109
            WHERE   ORD_NO   = CUR30.ORD_NO
            AND     SCHD_SEQ = CUR30.SCHD_SEQ;

            IF SQL%NOTFOUND THEN
                v_Return_Message := '계약번호('||CUR30.ORD_NO||')와 청구순번('||CUR30.SCHD_SEQ||')으로 청구스케쥴을 찾을 수 없습니다. 처리 불가!';
                RAISE e_Error;
            END IF;

            -- 수납 대상 내역(RTRE0031) 생성
            IF 0 != Pkg_Rtre0031.f_InsertRtre0031(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                                  CUR30.SCHD_SEQ, CUR30.CUST_NO, v_Recp_Tp_B, v_Sale_Amt_B,
                                                  v_Arre_Amt_B, v_Zfb_Day_B, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납취소(미수금) 수납 대상 내역(RTRE0031) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 수납금액: 기존수납금액 + 현재수납금액(-)
            v_Recp_Amt_A := NVL(v_Recp_Amt_B,0) + (NVL(CUR30.RECP_AMT,0) * -1);

            -- 연체금액(미납금액) : 매출액 - 수납금액
            v_Arre_Amt_A := NVL(v_Sale_Amt_B,0) - v_Recp_Amt_A;

            -- 수납여부 획득 (Y:수납, P:부분수납, N:미수납)
            -- 수납금액 = 매출액
            IF v_Recp_Amt_A  = NVL(v_Sale_Amt_B,0) THEN
                v_Rc_Yn_A := 'Y';

            -- 수납금액 < 매출액
            ELSIF (v_Recp_Amt_A > 0) AND (v_Recp_Amt_A < NVL(v_Sale_Amt_B,0)) THEN
                v_Rc_Yn_A := 'P';

            -- 수납금액 = 0
            ELSIF v_Recp_Amt_A = 0 THEN
                v_Rc_Yn_A := 'N';

            --  수납금액 > 매출액
            ELSIF v_Recp_Amt_A > NVL(v_Sale_Amt_B,0) THEN
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 보다 수납금액('||v_Recp_Amt_A||')이 크므로 처리가 불가합니다!!';
                RAISE e_Error;
            ELSE
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 또는 수납금액('||v_Recp_Amt_A||')의 문제로 처리가 불가합니다!!';
                RAISE e_Error;
            END IF;

            -- 청구스케줄(RTSD0109) Update - 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자)
            IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109ReceiptState (CUR30.ORD_NO, CUR30.SCHD_SEQ, v_Rc_Yn_A, v_Recp_Amt_A,
                                                               v_Arre_Amt_A, v_Recv_Day, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '청구스케줄(RTSD0109) 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자) 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        -- 선수금 :  수납내역(RTRE0030)의 스케쥴번호(SCHD_SEQ)가 NULL인 선수금수납 처리
        ELSE

            -- 선수금잔액 =  선수 발생금액(PND_AMT) - 선수 정리금액(SBS_AMT)
            v_BalanceAmt2 := Pkg_Rtre0035.f_sRtre0035BalanceAmt2(CUR30.RECV_SEQ, CUR30.RITM_SEQ);

            -- 선수금잔액 > 0 AND  선수발생금액(PND_AMT) >= 선수금잔액
            IF v_BalanceAmt2 > 0 AND CUR30.RECP_AMT >= v_BalanceAmt2 THEN


                -- 수납취소거래일련번호 획득
                v_Cnc_Iseq := f_sRtre0030RitmSeq(v_Cnc_Rseq);

                -- 수납취소거래일련번호종료 = 수납취소거래일련번호
                v_Cnc_Ioseq := v_Cnc_Iseq;

                -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
                IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq,
                                                                v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                v_RecpAAA_Amt := CUR30.RECP_AMT -  v_BalanceAmt2;
                v_RecpBBB_Amt := v_BalanceAmt2;
                v_BalanceAmt2 := 0;

                -- 수납 내역 생성 (-)
                IF 0 != f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                         CUR30.CUST_NO, CUR30.RECP_ID, - v_RecpBBB_Amt, CUR30.RECP_TP,
                                         CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN,
                                         v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                         v_ErrorText) THEN
                    v_Return_Message := '수납취소(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                -- 선수금 상태 획득 (P:발생, R:일부정리,  S:정리)
                IF v_BalanceAmt2 = 0 THEN
                    v_Pnd_Stat := 'S';
                ELSE
                    v_Pnd_Stat := 'R';
                END IF;

                -- 선수금 발생내역 업데이트
                IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_RecpBBB_Amt, v_Pnd_Stat,
                                                            v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                -- 선수금 정리내역 Insert
                IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                                      CUR30.CUST_NO, v_RecpBBB_Amt, CUR30.RECP_TP, CUR30.RECP_PAY,
                                                      v_Recp_Fg, v_Pnd_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ,
                                                      v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '선수금 정리내역 Insert!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;


            -- 선수금 정리후에도 잔액이 남은 경우
            IF v_RecpAAA_Amt > 0 THEN



                FOR CUR35 IN CUR_RTRE0035 LOOP
                    EXIT WHEN CUR_RTRE0035%NOTFOUND;

                    -- 선수금잔액 =  선수 발생금액(PND_AMT) - 선수 정리금액(SBS_AMT)
                    v_BalanceAmt3 := CUR35.PND_AMT -  CUR35.SBS_AMT;

                    -- 취소잔액이 선수금액보다 클 경우에는 선수금 전액 취소처리
                    IF v_BalanceAmt3 < v_RecpAAA_Amt THEN

                        v_RecpAAA_Amt := v_RecpAAA_Amt - v_BalanceAmt3;
                        v_RecpBBB_Amt := v_BalanceAmt3;
                        v_BalanceAmt3 := 0;
                    ELSE
                        v_RecpBBB_Amt := v_RecpAAA_Amt;
                        v_BalanceAmt3 := v_BalanceAmt3 - v_RecpAAA_Amt;
                        v_RecpAAA_Amt := 0;

                    END IF;

                    -- 수납취소거래일련번호종료
                    v_Cnc_Ioseq := f_sRtre0030RitmSeq(v_Cnc_Rseq);

                    -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
                    IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq,
                                                                       v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    -- 수납 내역 생성 (-)
                    IF 0 != f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                             CUR30.CUST_NO, CUR30.RECP_ID, - v_RecpBBB_Amt, CUR35.RECP_TP,
                                             CUR35.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN,
                                             v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                             v_ErrorText) THEN
                        v_Return_Message := '수납취소(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    -- 선수금 상태 획득 (P:발생, R:일부정리,  S:정리)
                    IF v_BalanceAmt3 = 0 THEN
                        v_Pnd_Stat := 'S';
                    ELSE
                        v_Pnd_Stat := 'R';
                    END IF;

                    -- 선수금 발생내역 업데이트
                    IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(CUR35.RECV_SEQ, CUR35.RITM_SEQ, v_RecpBBB_Amt, v_Pnd_Stat,
                                                                v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    -- 선수금 정리내역 Insert
                    IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                                          CUR30.CUST_NO, v_RecpBBB_Amt, CUR35.RECP_TP, CUR35.RECP_PAY,
                                                          v_Recp_Fg, v_Pnd_Stat, CUR35.RECV_SEQ, CUR35.RITM_SEQ,
                                                          v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '선수금 정리내역 Insert!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    IF v_RecpAAA_Amt = 0 THEN
                        EXIT;
                    END IF;

                END LOOP;

                IF v_RecpAAA_Amt > 0 THEN
                    v_Return_Message := '선수금 금액(RTRE0035) 오류(부족)로 처리 실패!!';
                    RAISE e_Error;
                END IF;

            END IF;

        END IF;

    END LOOP;

    -- 수납거래번호로 수납방법 획득
    v_Recp_Pay := Pkg_Rtre0030.f_sRtre0030Recp_Pay(v_Recv_Seq);
    IF TRIM(v_Recp_Pay) = 'P6' THEN  -- 계좌즉시출금
        -- 계좌즉시출금 수납내역 - 수납취소(환불아님) - 원거래수납수정 (DEFAULT VALUE : v_Recp_Fg = '11', v_Cnc_Stat = 'S'('N' = 정상, 'Y' = 전체환불, 'P' = 부분환불, 'S' = 수납취소)
        IF 0 != Pkg_Rtre0210.f_UpdateRtre0210Cancle(v_Recv_Seq, v_Cnc_Rseq, 'Y', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 원거래 수납(RTRE0210) 수정시 에러 발생!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF TRIM(v_Recp_Pay) = 'P7' THEN
        -- 카드즉시출금 수납내역 - 수납취소(환불아님) - 원거래수납수정 (DEFAULT VALUE : v_Recp_Fg = '11', v_Cnc_Stat = 'S'('N' = 정상, 'Y' = 전체환불, 'P' = 부분환불, 'S' = 수납취소)
        IF 0 != Pkg_Rtre0200.f_UpdateRtre0200Cancle(v_Recv_Seq, v_Cnc_Rseq, 'Y', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 원거래 수납(RTRE0200) 수정시 에러 발생!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    -- ELSIF TRIM(v_Recp_Pay) = 'V3' THEN

    END IF;


    IF CUR_RTRE0030%ISOPEN THEN
        CLOSE CUR_RTRE0030;
    END IF;

    IF CUR_RTRE0035%ISOPEN THEN
        CLOSE CUR_RTRE0035;
    END IF;

    IF v_exist = FALSE THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||')에 해당하는 데이터가 존재하지 않아 처리가 불가 합니다.!';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0030Cancel;

  /*****************************************************************************
  -- CMS 수납세부 내역 조회 Select
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-10-18  wjim             [20170224_01] 청구순번 추가
  *****************************************************************************/
  PROCEDURE p_sRtre0030Detail(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*수납거래번호        */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  RECV_SEQ,                                                         /*수납거래번호        */
            RITM_SEQ,                                                         /*거래일련번호        */
            RECV_DAY,                                                         /*수납일자            */
            ORD_NO,                                                           /*계약번호            */
            CUST_NO,                                                          /*고객번호            */
            Pkg_Rtsd0100.f_sRtsd0100CustName( CUST_NO ) AS CUST_NM,           /*고객명              */
            RECP_TP,                                                          /*청구구분            */
            Pkg_rtcm0051.f_sRtcm0051CodeName( 'R007', RECP_TP ) AS RECP_TP_NM,/*청구구분명          */
            SCHD_SEQ,                                                         /*청구순번            */
            Pkg_rtsd0109.f_sRtsd0109RecpNu( ORD_NO, SCHD_SEQ ) AS RECP_NU,    /*청구회차            */
            Pkg_rtsd0109.f_sRtsd0109ZfbDay( ORD_NO, SCHD_SEQ ) AS ZFB_DAY,    /*만기일자            */
            RECP_AMT                                                          /*수납금액            */
      FROM  RTRE0030
     WHERE  RECV_SEQ = v_Recv_Seq;

  END p_sRtre0030Detail;

  /*****************************************************************************
  -- 수납 내역 - 수납거래번호 체번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030RecvSeq RETURN NUMBER IS
    v_Recv_Seq  RTRE0030.RECV_SEQ%TYPE DEFAULT NULL;     /*수납거래번호        */
  BEGIN

    SELECT  SEQ_Rtre0030Recv_Seq.NEXTVAL RPC_SEQ
    INTO    v_Recv_Seq
    FROM    DUAL;

    RETURN v_Recv_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0030RecvSeq;


  /*****************************************************************************
  -- 수납 내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030RitmSeq(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_Ritm_Seq  RTRE0030.RITM_SEQ%TYPE DEFAULT NULL;    /*거래일련번호        */
  BEGIN

    SELECT  NVL((SELECT  MAX(RITM_SEQ)
                 FROM    RTRE0030
                 WHERE   RECV_SEQ = v_Recv_Seq)+ 1, 1) AS RITM_SEQ
    INTO    v_Ritm_Seq
    FROM    DUAL;

    RETURN v_Ritm_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0030RitmSeq;


  /*****************************************************************************
  -- 수납 내역 Count - 수납거래번호 기준 현금영수증 발행여부(건수) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030CashYnCnt(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0030
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CASH_YN  = 'Y';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0030CashYnCnt;

  /*****************************************************************************
  -- 수납 내역 -  수납거래번호로 선수금(합계) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030RecpAmtSum(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE        /*수납거래번호          */
    ) RETURN NUMBER IS
    v_Recp_Amt_Sum RTRE0030.RECP_AMT%TYPE DEFAULT 0;  /*수납금액              */
  BEGIN

    SELECT  SUM(NVL(RECP_AMT,0))
    INTO    v_Recp_Amt_Sum
    FROM    RTRE0030
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RECP_TP  = '90'; -- 청구구분 : 선수금(90)

    RETURN v_Recp_Amt_Sum;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0030RecpAmtSum;



  /*****************************************************************************
  -- 수납 내역 -  수납거래번호로 수납취소 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030CncStatYCnt(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE        /*수납거래번호          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(RECV_SEQ)
    INTO    v_curr_cunt
    FROM    RTRE0030
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CNC_STAT  = 'Y'; -- 수납취소여부

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0030CncStatYCnt;


  /*****************************************************************************
  -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030CncBefore (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0030
    SET    CNC_STAT  = v_Cnc_Stat,
           CNC_RSEQ  = v_Cnc_Rseq,
           CNC_ISEQ  = v_Cnc_Iseq,
           CNC_IOSEQ = v_Cnc_Ioseq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  RECV_SEQ  = v_Recv_Seq
    AND    RITM_SEQ  = v_Ritm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0030CncBefore;


  /*****************************************************************************
  -- 수납 내역 Update - 대상집계된 수납내역의 현금영수증 발행여부(CASH_YN) 에 'P' (발행처리중) 값으로 업데이트 한다.
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030Aggregate (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN


    UPDATE RTRE0030
    SET    CASH_YN   = v_Cash_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  RECV_SEQ  = v_Recv_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0030Aggregate;


  /*****************************************************************************
  -- 수납거래번호에 대하여 수납방법코드를 조회한다.
  *****************************************************************************/
  FUNCTION f_sRtre0030Recp_Pay (
    v_Recv_Seq      IN RTRE0030.RECV_SEQ%TYPE       /*수납거래번호          */
    ) RETURN VARCHAR IS

    v_Recp_Pay      RTRE0030.RECP_PAY%TYPE;         /*수납방법              */
  BEGIN

    SELECT  RECP_PAY
    INTO    v_Recp_Pay
    FROM    RTRE0030
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     ROWNUM   = 1;

    RETURN v_Recp_Pay;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN '';

  END f_sRtre0030Recp_Pay;


  /*****************************************************************************
  -- 수납 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0030AFRecpAmtSum(
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE        /*스케줄순번            */
    ) RETURN NUMBER IS
    v_Recp_Amt  RTRE0030.RECP_AMT%TYPE DEFAULT 0;     /*수납금액              */
  BEGIN

    SELECT  SUM( NVL(RECP_AMT,0) ) AS RECP_AMT
    INTO    v_Recp_Amt
    FROM    RTRE0030
    WHERE   ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No
    AND     RECV_DAY > v_Recv_Day
    AND     RECV_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
    AND     SCHD_SEQ = v_Schd_Seq;

    RETURN v_Recp_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0030AFRecpAmtSum;


  /*****************************************************************************
  -- 수납 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030RecvList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE        /*스케줄순번            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ                                                 AS RECV_SEQ,      /*수납거래번호   */
            A.RITM_SEQ                                                 AS RITM_SEQ,      /*거래일련번호   */
            A.RECV_DAY                                                 AS RECV_DAY,      /*수납일자       */
            A.ORD_NO                                                   AS ORD_NO,        /*계약번호       */
            A.RECP_TP                                                  AS RECP_TP ,      /*청구구분       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R007',A.RECP_TP)         AS RECP_TNM,      /*청구구분명     */
            A.RECP_PAY                                                 AS RECP_PAY,      /*수납방법       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R019',A.RECP_PAY)        AS RECP_PNM,      /*수납방법명     */
            A.RECP_FG                                                  AS RECP_FG,       /*수납유형       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R020',A.RECP_FG)         AS RECP_FNM,      /*수납유형명     */
            A.RECP_AMT                                                 AS RECP_AMT,      /*수납금액       */
            A.SCHD_SEQ                                                 AS SCHD_SEQ,      /*청구순번       */
            B.RECP_NU                                                  AS RECP_NU,       /*청구회차       */
            A.CNC_STAT                                                 AS CNC_STAT,      /*취소상태       */
            C.TNO                                                      AS TNO,           /*PG 거래번호    */
            E.BANK_CD                                                  AS BANK_CD,       /*은행코드       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',E.BANK_CD)         AS BANK_NM,       /*은행명         */
            E.ACCT_NO                                                  AS ACCT_NO,       /*계좌번호       */
            G.CARDCOM_CD                                               AS CARDCOM_CD,    /*카드사코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD)      AS CARDCOM_NM,    /*카드사명       */
            G.CARD_NO                                                  AS CARD_NO,       /*카드번호       */
            H.BANK_RECP_DAY                                            AS BANK_RECP_DAY  /*은행입금일     */
    FROM    RTRE0030 A,
            RTSD0109 B,
            RTRE0041 C,
            RTRE0070 D,
            RTRE0010 E,
            RTRE0080 F,
            RTRE0020 G,
            RTRE0040 H
    WHERE   A.ORD_NO = v_Ord_No
    AND     (v_Schd_Seq IS NULL OR A.SCHD_SEQ = v_Schd_Seq)
    AND     A.ORD_NO   = B.ORD_NO(+)
    AND     A.SCHD_SEQ = B.SCHD_SEQ(+)
    AND     DECODE(A.RECP_FG, '01', DECODE(A.RECP_PAY, 'P1', A.RECV_SEQ, 'P2', A.RECV_SEQ, 'P3', A.RECV_SEQ)) = C.RECV_SEQ(+)
    AND     DECODE(A.RECP_FG, '01', DECODE(A.RECP_PAY, 'C1', A.RECV_SEQ)) = D.RECV_SEQ(+)
    AND     D.ACC_SEQ  = E.ACC_SEQ(+)
    AND     DECODE(A.RECP_FG, '01', DECODE(A.RECP_PAY, 'C2', A.RECV_SEQ)) = F.RECV_SEQ(+)
    AND     F.CRD_SEQ  = G.CRD_SEQ(+)
    AND     DECODE(A.RECP_FG, '01', DECODE(A.RECP_PAY, 'A1', A.RECV_SEQ)) = H.RECV_SEQ(+)
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;

  END p_sRtre0030RecvList;

  /*****************************************************************************
  --  쇼핑몰연체내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030ShopArreList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key         IN RTSD0100.SAFEKEY%TYPE         /*세이프키              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT B.ORD_NO
         , NVL( (  SELECT  SUM( NVL(Y.ARRE_AMT,0) )
                     FROM    RTSD0109 Y
                    WHERE   Y.ORD_NO = B.ORD_NO
                      AND     B.STAT_CD NOT IN ('06')
                      AND     Y.ARRE_AMT > 0
                      AND     Y.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                      AND     Y.SCD_STAT = 'S' ), 0) AS ARRE_AMT
         , NVL( (  SELECT  MAX(COUNT(*))
                     FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                      AND     B.STAT_CD NOT IN ('06')
                      AND    X.ARRE_AMT > 0
                      AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                      AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP ), 0) AS ARRE_MON
      FROM RTSD0100 A
         , RTSD0104 B
     WHERE 1=1
       AND A.CUST_NO = B.CUST_NO
       AND A.SAFEKEY = v_Safe_Key ;
       
  END p_sRtre0030ShopArreList;
  
  /*****************************************************************************
  -- 수납 내역 관리 - 수납취소처리:수납내역생성처리(Ritm_Seq 컬럼 기준)
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030Cancel_Ritm (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*수납순서              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 수납내역
    CURSOR  CUR_RTRE0030 IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_ID,                   /*수납자ID            */
            A.RECP_AMT,                  /*수납금액            */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CASH_YN,                   /*현금영수증 발행여부 */
            A.CNC_STAT,                  /*수납취소여부        */
            A.CNC_RSEQ,                  /*수납취소거래번호    */
            A.CNC_ISEQ,                  /*수납취소거래일련번호*/
            A.CNC_IOSEQ                  /*수납취소거래번호종료*/
    FROM    RTRE0030 A
    WHERE   A.RECV_SEQ = v_Recv_Seq
    AND A.RITM_SEQ = v_Ritm_Seq
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;

    -- 추가 선수금 내역
    CURSOR  CUR_RTRE0035 IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.PND_DAY,                   /*선수 발생일자       */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.PND_AMT,                   /*선수 발생금액       */
            A.SBS_AMT,                   /*선수 정리금액       */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.PND_STAT                   /*선수금상태          */
    FROM    RTRE0035 A
    WHERE   A.RECV_SEQ  <> v_Recv_Seq
    AND     A.ORD_NO   = v_Ord_No
    AND     A.CUST_NO  = v_Cust_No
    AND     (A.PND_AMT - A.SBS_AMT) > 0
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;

    e_Error EXCEPTION;

    v_Recp_Fg   RTRE0030.RECP_FG%TYPE DEFAULT '11';   /*수납유형              */
    v_Cnc_Stat  RTRE0030.CNC_STAT%TYPE DEFAULT 'Y';   /*수납취소여부          */
    v_Cnc_Iseq  RTRE0030.CNC_ISEQ%TYPE DEFAULT NULL;  /*수납취소거래일련번호  */
    v_Cnc_Ioseq RTRE0030.CNC_IOSEQ%TYPE DEFAULT NULL; /*수납취소거래번호 종료 */
    v_Recp_Pay  RTRE0030.RECP_PAY%TYPE DEFAULT NULL; /*수납방법 */  -- 신규추가

    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE DEFAULT NULL;  /*선수금상태            */

    v_BalanceAmt   NUMBER DEFAULT 0; -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산)
    v_RecpAmtSum   NUMBER DEFAULT 0; -- 수납거래번호로 선수금(RTRE0030) 합계

    v_BalanceAmt2  NUMBER DEFAULT 0; -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산)
    v_BalanceAmt3  NUMBER DEFAULT 0;

    v_RecpAAA_Amt NUMBER DEFAULT 0;
    v_RecpBBB_Amt NUMBER DEFAULT 0;

    v_Recp_Tp_B  RTSD0109.RECP_TP%TYPE DEFAULT NULL;  /*청구구분              */
    v_Recp_Amt_B RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_B RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_B RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */
    v_Zfb_Day_B  RTSD0109.ZFB_DAY%TYPE DEFAULT NULL;  /*만기계산기준일        */

    v_Rc_Yn_A    RTSD0109.RC_YN%TYPE DEFAULT NULL;    /*수납여부              */
    v_Recp_Amt_A RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_A RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_A RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */


    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
  BEGIN

    -- 필수값:  수납일자, 수납거래번호, 계약번호, 고객번호, 수납취소거래번호, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No))THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cnc_Rseq) IS NULL THEN
        v_Return_Message := '수납취소거래번호('||v_Cnc_Rseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN

        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
            v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산) 획득
    v_BalanceAmt := Pkg_Rtre0035.f_sRtre0035BalanceAmt(v_Ord_No, v_Cust_No);

    -- 수납거래번호로 선수금(RTRE0030) 합계 획득
    v_RecpAmtSum := Pkg_Rtre0030.f_sRtre0030RecpAmtSum(v_Recv_Seq);

    -- 선수금 잔액 확인하여 취소금액보다 큰경우 취소 가능
    -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산) < 수납거래번호로 선수금(RTRE0030) 합계
    IF v_BalanceAmt < v_RecpAmtSum THEN
        v_Return_Message := '취소금액이 선수금 잔액보다 크므로 처리가 불가능합니다.확인 바랍니다.!';
        RAISE e_Error;
    END IF;


    -- 수납거래번호 기준 취소처리
    FOR CUR30 IN CUR_RTRE0030 LOOP
        EXIT WHEN CUR_RTRE0030%NOTFOUND;
        v_exist := TRUE;

        -- 미수금 : 수납내역(RTRE0030)의 스케쥴번호(SCHD_SEQ)가 존재하는 미수금수납 처리
        IF CUR30.SCHD_SEQ IS NOT NULL THEN

            -- 수납취소거래일련번호 획득
            v_Cnc_Iseq := f_sRtre0030RitmSeq(v_Cnc_Rseq);

            -- 수납취소거래일련번호종료 = 수납취소거래일련번호
            v_Cnc_Ioseq := v_Cnc_Iseq;

            -- 수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트
            IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq,
                                                            v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 수납 내역(RTRE0030) 생성 (-)
            IF 0 != f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                     CUR30.CUST_NO, CUR30.RECP_ID, - CUR30.RECP_AMT, CUR30.RECP_TP,
                                     CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN,
                                     v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '수납취소(미수금) 수납 내역(RTRE0030) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- 청구 스케줄 :  청구구분, 수납금액, 매출금액, 연체금액(미납금액), 만기계산기준일 획득
            SELECT  RECP_TP, NVL(RECP_AMT,0), NVL(SALE_AMT,0), NVL(ARRE_AMT,0), ZFB_DAY
            INTO    v_Recp_Tp_B, v_Recp_Amt_B, v_Sale_Amt_B, v_Arre_Amt_B, v_Zfb_Day_B
            FROM    RTSD0109
            WHERE   ORD_NO   = CUR30.ORD_NO
            AND     SCHD_SEQ = CUR30.SCHD_SEQ;

            IF SQL%NOTFOUND THEN
                v_Return_Message := '계약번호('||CUR30.ORD_NO||')와 청구순번('||CUR30.SCHD_SEQ||')으로 청구스케쥴을 찾을 수 없습니다. 처리 불가!';
                RAISE e_Error;
            END IF;

            -- 수납 대상 내역(RTRE0031) 생성
            IF 0 != Pkg_Rtre0031.f_InsertRtre0031(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                                  CUR30.SCHD_SEQ, CUR30.CUST_NO, v_Recp_Tp_B, v_Sale_Amt_B,
                                                  v_Arre_Amt_B, v_Zfb_Day_B, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납취소(미수금) 수납 대상 내역(RTRE0031) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 수납금액: 기존수납금액 + 현재수납금액(-)
            v_Recp_Amt_A := NVL(v_Recp_Amt_B,0) + (NVL(CUR30.RECP_AMT,0) * -1);

            -- 연체금액(미납금액) : 매출액 - 수납금액
            v_Arre_Amt_A := NVL(v_Sale_Amt_B,0) - v_Recp_Amt_A;

            -- 수납여부 획득 (Y:수납, P:부분수납, N:미수납)
            -- 수납금액 = 매출액
            IF v_Recp_Amt_A  = NVL(v_Sale_Amt_B,0) THEN
                v_Rc_Yn_A := 'Y';

            -- 수납금액 < 매출액
            ELSIF (v_Recp_Amt_A > 0) AND (v_Recp_Amt_A < NVL(v_Sale_Amt_B,0)) THEN
                v_Rc_Yn_A := 'P';

            -- 수납금액 = 0
            ELSIF v_Recp_Amt_A = 0 THEN
                v_Rc_Yn_A := 'N';

            --  수납금액 > 매출액
            ELSIF v_Recp_Amt_A > NVL(v_Sale_Amt_B,0) THEN
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 보다 수납금액('||v_Recp_Amt_A||')이 크므로 처리가 불가합니다!!';
                RAISE e_Error;
            ELSE
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 또는 수납금액('||v_Recp_Amt_A||')의 문제로 처리가 불가합니다!!';
                RAISE e_Error;
            END IF;

            -- 청구스케줄(RTSD0109) Update - 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자)
            IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109ReceiptState (CUR30.ORD_NO, CUR30.SCHD_SEQ, v_Rc_Yn_A, v_Recp_Amt_A,
                                                               v_Arre_Amt_A, v_Recv_Day, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '청구스케줄(RTSD0109) 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자) 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        -- 선수금 :  수납내역(RTRE0030)의 스케쥴번호(SCHD_SEQ)가 NULL인 선수금수납 처리
        ELSE

            -- 선수금잔액 =  선수 발생금액(PND_AMT) - 선수 정리금액(SBS_AMT)
            v_BalanceAmt2 := Pkg_Rtre0035.f_sRtre0035BalanceAmt2(CUR30.RECV_SEQ, CUR30.RITM_SEQ);

            -- 선수금잔액 > 0 AND  선수발생금액(PND_AMT) >= 선수금잔액
            IF v_BalanceAmt2 > 0 AND CUR30.RECP_AMT >= v_BalanceAmt2 THEN


                -- 수납취소거래일련번호 획득
                v_Cnc_Iseq := f_sRtre0030RitmSeq(v_Cnc_Rseq);

                -- 수납취소거래일련번호종료 = 수납취소거래일련번호
                v_Cnc_Ioseq := v_Cnc_Iseq;

                -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
                IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq,
                                                                v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                v_RecpAAA_Amt := CUR30.RECP_AMT -  v_BalanceAmt2;
                v_RecpBBB_Amt := v_BalanceAmt2;
                v_BalanceAmt2 := 0;

                -- 수납 내역 생성 (-)
                IF 0 != f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                         CUR30.CUST_NO, CUR30.RECP_ID, - v_RecpBBB_Amt, CUR30.RECP_TP,
                                         CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN,
                                         v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                         v_ErrorText) THEN
                    v_Return_Message := '수납취소(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                -- 선수금 상태 획득 (P:발생, R:일부정리,  S:정리)
                IF v_BalanceAmt2 = 0 THEN
                    v_Pnd_Stat := 'S';
                ELSE
                    v_Pnd_Stat := 'R';
                END IF;

                -- 선수금 발생내역 업데이트
                IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_RecpBBB_Amt, v_Pnd_Stat,
                                                            v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                -- 선수금 정리내역 Insert
                IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                                      CUR30.CUST_NO, v_RecpBBB_Amt, CUR30.RECP_TP, CUR30.RECP_PAY,
                                                      v_Recp_Fg, v_Pnd_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ,
                                                      v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '선수금 정리내역 Insert!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;


            -- 선수금 정리후에도 잔액이 남은 경우
            IF v_RecpAAA_Amt > 0 THEN



                FOR CUR35 IN CUR_RTRE0035 LOOP
                    EXIT WHEN CUR_RTRE0035%NOTFOUND;

                    -- 선수금잔액 =  선수 발생금액(PND_AMT) - 선수 정리금액(SBS_AMT)
                    v_BalanceAmt3 := CUR35.PND_AMT -  CUR35.SBS_AMT;

                    -- 취소잔액이 선수금액보다 클 경우에는 선수금 전액 취소처리
                    IF v_BalanceAmt3 < v_RecpAAA_Amt THEN

                        v_RecpAAA_Amt := v_RecpAAA_Amt - v_BalanceAmt3;
                        v_RecpBBB_Amt := v_BalanceAmt3;
                        v_BalanceAmt3 := 0;
                    ELSE
                        v_RecpBBB_Amt := v_RecpAAA_Amt;
                        v_BalanceAmt3 := v_BalanceAmt3 - v_RecpAAA_Amt;
                        v_RecpAAA_Amt := 0;

                    END IF;

                    -- 수납취소거래일련번호종료
                    v_Cnc_Ioseq := f_sRtre0030RitmSeq(v_Cnc_Rseq);

                    -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
                    IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq,
                                                                       v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    -- 수납 내역 생성 (-)
                    IF 0 != f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                             CUR30.CUST_NO, CUR30.RECP_ID, - v_RecpBBB_Amt, CUR35.RECP_TP,
                                             CUR35.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN,
                                             v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                             v_ErrorText) THEN
                        v_Return_Message := '수납취소(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    -- 선수금 상태 획득 (P:발생, R:일부정리,  S:정리)
                    IF v_BalanceAmt3 = 0 THEN
                        v_Pnd_Stat := 'S';
                    ELSE
                        v_Pnd_Stat := 'R';
                    END IF;

                    -- 선수금 발생내역 업데이트
                    IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(CUR35.RECV_SEQ, CUR35.RITM_SEQ, v_RecpBBB_Amt, v_Pnd_Stat,
                                                                v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    -- 선수금 정리내역 Insert
                    IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO,
                                                          CUR30.CUST_NO, v_RecpBBB_Amt, CUR35.RECP_TP, CUR35.RECP_PAY,
                                                          v_Recp_Fg, v_Pnd_Stat, CUR35.RECV_SEQ, CUR35.RITM_SEQ,
                                                          v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '선수금 정리내역 Insert!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    IF v_RecpAAA_Amt = 0 THEN
                        EXIT;
                    END IF;

                END LOOP;

                IF v_RecpAAA_Amt > 0 THEN
                    v_Return_Message := '선수금 금액(RTRE0035) 오류(부족)로 처리 실패!!';
                    RAISE e_Error;
                END IF;

            END IF;

        END IF;

    END LOOP;

    -- 수납거래번호로 수납방법 획득
    v_Recp_Pay := Pkg_Rtre0030.f_sRtre0030Recp_Pay(v_Recv_Seq);
    IF TRIM(v_Recp_Pay) = 'P6' THEN  -- 계좌즉시출금
        -- 계좌즉시출금 수납내역 - 수납취소(환불아님) - 원거래수납수정 (DEFAULT VALUE : v_Recp_Fg = '11', v_Cnc_Stat = 'S'('N' = 정상, 'Y' = 전체환불, 'P' = 부분환불, 'S' = 수납취소)
        IF 0 != Pkg_Rtre0210.f_UpdateRtre0210Cancle(v_Recv_Seq, v_Cnc_Rseq, 'Y', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 원거래 수납(RTRE0210) 수정시 에러 발생!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF TRIM(v_Recp_Pay) = 'P7' THEN
        -- 카드즉시출금 수납내역 - 수납취소(환불아님) - 원거래수납수정 (DEFAULT VALUE : v_Recp_Fg = '11', v_Cnc_Stat = 'S'('N' = 정상, 'Y' = 전체환불, 'P' = 부분환불, 'S' = 수납취소)
        IF 0 != Pkg_Rtre0200.f_UpdateRtre0200Cancle(v_Recv_Seq, v_Cnc_Rseq, 'Y', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 원거래 수납(RTRE0200) 수정시 에러 발생!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    -- ELSIF TRIM(v_Recp_Pay) = 'V3' THEN

    END IF;


    IF CUR_RTRE0030%ISOPEN THEN
        CLOSE CUR_RTRE0030;
    END IF;

    IF CUR_RTRE0035%ISOPEN THEN
        CLOSE CUR_RTRE0035;
    END IF;

    IF v_exist = FALSE THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||')에 해당하는 데이터가 존재하지 않아 처리가 불가 합니다.!';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0030Cancel_Ritm;
  
END Pkg_Rtre0030;