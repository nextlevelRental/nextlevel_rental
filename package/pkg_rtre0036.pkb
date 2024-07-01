CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0036 AS
/*******************************************************************************
   NAME      Pkg_Rtre0036
   PURPOSE   선수금 정리내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 선수금 정리내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0036Count(
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,          /*정리거래번호        */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE          /*정리거래일련번호    */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0036
    WHERE   SBS_SEQ  = v_Sbs_Seq
    AND     SBS_ISEQ = v_Sbs_Iseq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0036Count;

  /*****************************************************************************
  -- 선수금 정리내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0036 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SBS_SEQ,                   /*정리거래번호        */
            A.SBS_ISEQ,                  /*정리거래일련번호    */
            A.SBS_DAY,                   /*정리일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.SBS_AMT,                   /*선수 정리금액       */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.SBS_TP,                    /*정리구분            */
            A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0036 A
    WHERE   A.SBS_SEQ          = DECODE(v_Sbs_Seq        , NULL, A.SBS_SEQ         , v_Sbs_Seq)
    AND     A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.SBS_AMT          = DECODE(v_Sbs_Amt        , NULL, A.SBS_AMT         , v_Sbs_Amt)
    AND     A.RECP_TP          = DECODE(v_Recp_Tp        , NULL, A.RECP_TP         , v_Recp_Tp)
    AND     A.RECP_PAY         = DECODE(v_Recp_Pay       , NULL, A.RECP_PAY        , v_Recp_Pay)
    AND     A.RECP_FG          = DECODE(v_Recp_Fg        , NULL, A.RECP_FG         , v_Recp_Fg)
    AND     A.SBS_TP           = DECODE(v_Sbs_Tp         , NULL, A.SBS_TP          , v_Sbs_Tp)
    AND     A.RECV_SEQ         = DECODE(v_Recv_Seq       , NULL, A.RECV_SEQ        , v_Recv_Seq)
    AND     A.RITM_SEQ         = DECODE(v_Ritm_Seq       , NULL, A.RITM_SEQ        , v_Ritm_Seq)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0036;

  /*****************************************************************************
  -- 선수금 정리내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0036 (
            SBS_SEQ,
            SBS_ISEQ,
            SBS_DAY,
            ORD_NO,
            CUST_NO,
            SBS_AMT,
            RECP_TP,
            RECP_PAY,
            RECP_FG,
            SBS_TP,
            RECV_SEQ,
            RITM_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sbs_Seq,
            v_Sbs_Iseq,
            v_Sbs_Day,
            v_Ord_No,
            v_Cust_No,
            v_Sbs_Amt,
            v_Recp_Tp,
            v_Recp_Pay,
            v_Recp_Fg,
            v_Sbs_Tp,
            v_Recv_Seq,
            v_Ritm_Seq,
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

  END f_InsertRtre0036;

  /*****************************************************************************
  -- 선수금 정리내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0036
    SET    SBS_DAY          = v_Sbs_Day,
           ORD_NO           = v_Ord_No,
           CUST_NO          = v_Cust_No,
           SBS_AMT          = v_Sbs_Amt,
           RECP_TP          = v_Recp_Tp,
           RECP_PAY         = v_Recp_Pay,
           RECP_FG          = v_Recp_Fg,
           SBS_TP           = v_Sbs_Tp,
           RECV_SEQ         = v_Recv_Seq,
           RITM_SEQ         = v_Ritm_Seq,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  SBS_SEQ          = v_Sbs_Seq
    AND    SBS_ISEQ         = v_Sbs_Iseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0036;

  /*****************************************************************************
  -- 선수금 정리내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0036
    WHERE  SBS_SEQ  = v_Sbs_Seq
    AND    SBS_ISEQ = v_Sbs_Iseq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.f_DeleteRtre0036(2)', '정리거래번호', v_Sbs_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.f_DeleteRtre0036(2)', '정리거래일련번호', v_Sbs_Iseq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.f_DeleteRtre0036(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0036;

  /*****************************************************************************
  -- 선수금 정리내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0036 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN OUT RTRE0036.SBS_ISEQ%TYPE,   /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 정리거래번호, 계약번호 , 고객번호 , 선수 정리금액 , 청구구분 , 수납방법 , 수납유형 , 정리구분 , 수납거래번호 , 거래일련번호 , 등록자 ID
    IF TRIM(v_Sbs_Seq) IS NULL THEN
        v_Return_Message := '정리거래번호('||v_Sbs_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Sbs_Day) THEN
        v_Return_Message := '정리일자('||v_Sbs_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

    IF TRIM(v_Sbs_Amt) IS NULL THEN
        v_Return_Message := '선수 정리금액('||v_Sbs_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Tp) IS NULL THEN
        v_Return_Message := '청구구분('||v_Recp_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Pay) IS NULL THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Fg) IS NULL THEN
        v_Return_Message := '수납유형('||v_Recp_Fg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sbs_Tp) IS NULL THEN
        v_Return_Message := '정리구분('||v_Sbs_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ritm_Seq) IS NULL THEN
        v_Return_Message := '거래일련번호('||v_Ritm_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0036Count(v_Sbs_Seq, v_Sbs_Iseq) THEN
            v_Return_Message := '해당건('||v_Sbs_Seq||'-'||v_Sbs_Iseq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_Sbs_Iseq := f_sRtre0036SbsIseq(v_Sbs_Seq);

        IF 0 != f_InsertRtre0036(v_Sbs_Seq , v_Sbs_Iseq, v_Sbs_Day, v_Ord_No , v_Cust_No , v_Sbs_Amt ,
                                 v_Recp_Tp , v_Recp_Pay , v_Recp_Fg , v_Sbs_Tp ,
                                 v_Recv_Seq , v_Ritm_Seq , v_Reg_Id , v_ErrorText) THEN
            v_Return_Message := '선수금 정리내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF 0 = f_sRtre0036Count(v_Sbs_Seq, v_Sbs_Iseq) THEN
            v_Return_Message := '해당건('||v_Sbs_Seq||'-'||v_Sbs_Iseq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtre0036(v_Sbs_Seq, v_Sbs_Iseq, v_Sbs_Day , v_Ord_No , v_Cust_No , v_Sbs_Amt ,
                                     v_Recp_Tp , v_Recp_Pay , v_Recp_Fg , v_Sbs_Tp ,
                                     v_Recv_Seq , v_Ritm_Seq , v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '선수금 정리내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtre0036(v_Sbs_Seq , v_Sbs_Iseq, v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '선수금 정리내역 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.p_IUDRtre0036(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.p_IUDRtre0036(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0036;

  /*****************************************************************************
  -- 선수금 정리내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0036SbsIseq (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE         /*정리거래번호          */
  ) RETURN NUMBER IS
    v_Sbs_Iseq RTRE0036.SBS_ISEQ%TYPE DEFAULT NULL;   /*정리거래일련번호      */
  BEGIN


    SELECT  NVL((SELECT  MAX(SBS_ISEQ)
                 FROM    RTRE0036
                 WHERE   SBS_SEQ = v_Sbs_Seq)+ 1, 1) AS SBS_ISEQ
    INTO    v_Sbs_Iseq
    FROM    DUAL;

    RETURN v_Sbs_Iseq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0036SbsIseq;


  /*****************************************************************************
  -- 선수금 정리내역 Select - 발생기준
  *****************************************************************************/
  PROCEDURE p_sRtre0036RecvRitm (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE        /*거래일련번호          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  SBS_SEQ,
            SBS_ISEQ,
            SBS_DAY,
            ORD_NO,
            CUST_NO,
            Pkg_Rtsd0100.f_sRtsd0100CustName( CUST_NO ) AS CUST_NM,
            SBS_AMT,
            RECP_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R007', RECP_TP ) AS RECP_TP_NM ,
            RECP_PAY,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R019', RECP_PAY ) AS RECP_PAY_NM,
            RECP_FG,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R020', RECP_FG ) AS RECP_FG_NM,
            SBS_TP,
            RECV_SEQ,
            RITM_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    FROM    RTRE0036
    WHERE   ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No
    AND     RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq
    ORDER  BY SBS_SEQ;


  END p_sRtre0036RecvRitm;

  /*****************************************************************************
  -- 선수금 정리내역 관리 - RE-040115_선수금 정리 취소 처리: 기 정리된 선수금 정리내역에 대하여 선수정리 취소를 진행하는 프로세스임
  *****************************************************************************/
  PROCEDURE p_InsertRtre0036CleanAdvance     (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
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
            NVL(A.RECP_AMT,0) RECP_AMT,  /*수납금액            */
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
    WHERE   A.RECV_SEQ = v_Sbs_Seq       /* 정리거래번호       */
    AND     A.RITM_SEQ = v_Sbs_Iseq      /*정리거래일련번호    */
    AND     A.ORD_NO   = v_Ord_No        /*계약번호            */
    AND     A.CUST_NO  = v_Cust_No       /*고객번호            */
    AND     A.RECP_FG  = '21'            /* 수납유형:선수정리  */
    AND     A.CNC_STAT = 'N'             /* 수납취소여부       */
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;


    CURSOR  CUR_RTSD0109 (v_Ord_No VARCHAR, v_Schd_Seq VARCHAR) IS
    SELECT  A.SCHD_SEQ,                  /*스케줄순번          */
            A.RECP_TP,                   /*청구구분            */
            A.ZFB_DAY,                   /*만기계산기준일      */
            NVL(A.SALE_AMT,0) SALE_AMT,  /*매출금액            */
            NVL(A.ARRE_AMT,0) ARRE_AMT,  /*연체금액            */
            NVL(A.RECP_AMT,0) RECP_AMT
    FROM    RTSD0109 A
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.SCHD_SEQ = v_Schd_Seq
    ORDER   BY A.ORD_NO, A.SCHD_SEQ;

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
    v_exist2 BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
    v_Recv_Seq    RTRE0030.RECV_SEQ%TYPE DEFAULT NULL; /*수납거래번호        */
    v_Sbs_Amt     RTRE0036.SBS_AMT%TYPE  DEFAULT NULL; /*선수 정리금액       */
    v_Recp_Fg     RTRE0036.RECP_FG%TYPE  DEFAULT NULL; /*수납유형            */
    v_Cash_Yn     RTRE0030.CASH_YN%TYPE  DEFAULT NULL; /*현금영수증 발행여부 */
    v_Cnc_Stat    RTRE0030.CNC_STAT%TYPE DEFAULT NULL; /*수납취소여부        */

    v_BFSbs_Amt   RTRE0036.SBS_AMT%TYPE  DEFAULT NULL; /*선수 정리금액       */
    v_BFPnd_Amt   RTRE0035.PND_AMT%TYPE  DEFAULT NULL; /*선수 발생금액       */
    v_BFRecp_Tp   RTRE0036.RECP_TP%TYPE  DEFAULT NULL; /*청구구분            */
    v_BFRecp_Pay  RTRE0036.RECP_PAY%TYPE DEFAULT NULL; /*수납방법            */
    v_BFRecv_Seq  RTRE0036.RECV_SEQ%TYPE DEFAULT NULL; /*수납거래번호        */
    v_BFRitm_Seq  RTRE0036.RITM_SEQ%TYPE DEFAULT NULL; /*거래일련번호        */

    v_AFSbs_Amt   RTRE0035.SBS_AMT%TYPE  DEFAULT NULL; /*선수 정리금액       */
    v_AFPnd_Stat  RTRE0035.PND_STAT%TYPE DEFAULT NULL; /*선수금상태          */

    v_Rc_Yn_A    RTSD0109.RC_YN%TYPE DEFAULT NULL;    /*수납여부              */
    v_Recp_Amt_A RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Sale_Amt_A RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_A RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */
  BEGIN

    -- 필수값: 정리거래번호, 계약번호 , 고객번호 ,정리거래번호 ,정리거래일련번호, 등록자 ID
    IF 0 != ISDATE(v_Sbs_Day) THEN
        v_Return_Message := '정리일자('||v_Sbs_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sbs_Seq) IS NULL THEN
        v_Return_Message := '정리거래번호('||v_Sbs_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sbs_Iseq) IS NULL THEN
        v_Return_Message := '정리거래일련번호('||v_Sbs_Iseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    BEGIN

        SELECT  A.SBS_AMT,                   /*선수 정리금액       */
                A.RECP_TP,                   /*청구구분            */
                A.RECP_PAY,                  /*수납방법            */
                A.RECV_SEQ,                  /*수납거래번호        */
                A.RITM_SEQ                   /*거래일련번호        */
        INTO    v_BFSbs_Amt, v_BFRecp_Tp, v_BFRecp_Pay, v_BFRecv_Seq, v_BFRitm_Seq
        FROM    RTRE0036 A
        WHERE   A.SBS_SEQ  = v_Sbs_Seq
        AND     A.SBS_ISEQ = v_Sbs_Iseq;
        
        v_exist := TRUE;

        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            v_exist := FALSE;
    END;

    IF v_exist = FALSE THEN    
                v_Return_Message := '해당 계약번호-정리거래번호('||v_Ord_No||'-'||v_Sbs_Seq||'-'||v_Sbs_Iseq||')는 선수금 정리내역(RTRE0036)의 수납유형이 선수정리(21) 상태가 아니므로 처리가 불가 합니다.!';

        RAISE e_Error;    
    END IF;

    -- 선수 정리 금액(취소) =  선수 정리 금액 * -1
    v_Sbs_Amt := NVL(v_BFSbs_Amt,0) * -1;

    -- 수납유형 : 선수 정리 취소(31)
    v_Recp_Fg := '31';

    -- 현금영수증 발행여부 : 미발행(N)
    v_Cash_Yn  := 'N';

    -- 수납취소여부 : 취소(Y)
    v_Cnc_Stat := 'Y';


    -- 수납거래번호 채번
    v_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();


    -- 선수금 정리 취소 내역(RTRE0036) 등록
    IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Recv_Seq , 0, v_Sbs_Day, v_Ord_No , v_Cust_No , v_Sbs_Amt ,
                                          v_BFRecp_Tp , v_BFRecp_Pay , v_Recp_Fg , NULL ,
                                          v_BFRecv_Seq , v_BFRitm_Seq , v_Reg_Id , v_ErrorText) THEN
        v_Return_Message := '선수금 정리 취소 내역 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    v_exist := FALSE;

    -- 수납거래번호 기준 취소처리
    FOR CUR30 IN CUR_RTRE0030 LOOP
        EXIT WHEN CUR_RTRE0030%NOTFOUND;
        v_exist := TRUE;


        -- 수납 내역(RTRE0030) 생성 (-)
        IF 0 != Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq, CUR30.RITM_SEQ, v_Sbs_Day, CUR30.ORD_NO,
                                             CUR30.CUST_NO, NULL, - CUR30.RECP_AMT, CUR30.RECP_TP,
                                             CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, v_Cash_Yn,
                                             v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id,
                                             v_ErrorText) THEN
            v_Return_Message := '선수금 정리 취소 처리 - 수납취소(미수금) 수납 내역(RTRE0030) 생성 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        v_exist2 := FALSE;

        -- 취소 대상의 RTRE0030 SCHD_SEQ 값으로 RTSD0109 내역에 대한 Snap shot 내역을 저장한다.
        FOR CUR09 IN CUR_RTSD0109(CUR30.ORD_NO, CUR30.SCHD_SEQ) LOOP
            EXIT WHEN CUR_RTSD0109%NOTFOUND;
            v_exist2 := TRUE;

            -- 수납 대상 내역(RTRE0031) 생성
            IF 0 != Pkg_Rtre0031.f_InsertRtre0031(v_Recv_Seq, CUR30.RITM_SEQ, v_Sbs_Day, CUR30.ORD_NO,
                                                  CUR30.SCHD_SEQ, CUR30.CUST_NO, CUR09.RECP_TP, CUR09.SALE_AMT,
                                                  CUR09.ARRE_AMT, CUR09.ZFB_DAY, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '선수금 정리 취소 처리 - 수납 대상 내역(RTRE0031) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- 수납금액: 기존수납금액 + 현재수납금액(-)
            v_Recp_Amt_A := CUR09.RECP_AMT + (CUR30.RECP_AMT * -1);

            -- 연체금액(미납금액) : 매출액 - 수납금액
            v_Arre_Amt_A := CUR09.SALE_AMT - v_Recp_Amt_A;

            -- 수납여부 획득 (Y:수납, P:부분수납, N:미수납)
            -- 수납금액 = 매출액
            IF v_Recp_Amt_A  = CUR09.SALE_AMT THEN
                v_Rc_Yn_A := 'Y';

            -- 수납금액 < 매출액
            ELSIF (v_Recp_Amt_A > 0) AND (v_Recp_Amt_A < CUR09.SALE_AMT) THEN
                v_Rc_Yn_A := 'P';

            -- 수납금액 = 0
            ELSIF v_Recp_Amt_A = 0 THEN
                v_Rc_Yn_A := 'N';

            --  수납금액 > 매출액
            ELSIF v_Recp_Amt_A > CUR09.SALE_AMT THEN
                v_Return_Message := '매출금액('||CUR09.SALE_AMT||') 보다 수납금액('||v_Recp_Amt_A||')이 크므로 처리가 불가합니다!!';
                RAISE e_Error;
            ELSE
                v_Return_Message := '매출금액('||CUR09.SALE_AMT||') 또는 수납금액('||v_Recp_Amt_A||')의 문제로 처리가 불가합니다!!';
                RAISE e_Error;
            END IF;

            -- 청구스케줄(RTSD0109) Update - 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자)
            IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109ReceiptState (CUR30.ORD_NO, CUR30.SCHD_SEQ, v_Rc_Yn_A, v_Recp_Amt_A,
                                                               v_Arre_Amt_A, v_Sbs_Day, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '청구스케줄(RTSD0109) 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자) 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        END LOOP;

        IF CUR_RTSD0109%ISOPEN THEN
            CLOSE CUR_RTSD0109;
        END IF;

        IF v_exist2 = FALSE THEN
            v_Return_Message := '해당 계약번호-정리거래번호('||v_Ord_No||'-'||v_Sbs_Seq||')에 해당하는 청수스케쥴정보(RTSD0109)가 없으므로 처리가 불가 합니다.!';
            RAISE e_Error;
        END IF;


        -- 기존 정리내역 RTRE0030 UPDATE ( 취소 관련 )
        IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore(CUR30.RECV_SEQ, CUR30.RITM_SEQ, 'Y', v_Recv_Seq,
                                                       CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '선수금 정리 취소 처리 - 수납취소(미수금) 수납 내역(RTRE0030) 생성 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;



    END LOOP;

    IF CUR_RTRE0030%ISOPEN THEN
        CLOSE CUR_RTRE0030;
    END IF;

    IF v_exist = FALSE THEN
        v_Return_Message := '해당 계약번호-정리거래번호('||v_Ord_No||'-'||v_Sbs_Seq||')는 선수금 정리내역의 수납유형이 선수정리(21) 상태 수납내역(RTRE0030)이 없으므로 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;

    /*
    UPDATE RTRE0035
    SET    SBS_AMT  = SBS_AMT - v_BFSbs_Amt,
           PND_STAT = ( CASE
                        WHEN PND_AMT = (SBS_AMT - v_BFSbs_Amt) THEN 'S'
                        WHEN PND_AMT > (SBS_AMT - v_BFSbs_Amt) AND (SBS_AMT - v_BFSbs_Amt) <> 0 THEN 'R'
                        WHEN SBS_AMT - v_BFSbs_Amt = 0 THEN 'P'
                        ELSE 'X'
                        END),
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  RECV_SEQ = v_BFRecv_Seq
    AND    RITM_SEQ = v_BFRitm_Seq;
   */

    v_BFSbs_Amt := 0;


    BEGIN

        -- 선수잔액 내역 확인
        SELECT  NVL(PND_AMT,0), NVL(SBS_AMT,0)
        INTO    v_BFPnd_Amt, v_BFSbs_Amt
        FROM    RTRE0035
        WHERE   RECV_SEQ = v_BFRecv_Seq
        AND     RITM_SEQ = v_BFRitm_Seq;
        
        v_exist := TRUE;

        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            v_exist := FALSE;
    END;


    IF v_exist = FALSE THEN
        v_Return_Message := '해당 계약번호-정리거래번호('||v_Ord_No||'-'||v_Sbs_Seq||')는 선수잔액 내역(RTRE0035) 확인결과 데이터가 존재하지 않음으로 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;


    -- 선수 정리 금액 = 기존  선수 정리 금액 +  (-) 선수 정리 취소 금액
    v_AFSbs_Amt := v_BFSbs_Amt + v_Sbs_Amt;

    IF (v_BFPnd_Amt = v_AFSbs_Amt) THEN
        v_AFPnd_Stat := 'S';
    ELSIF (v_BFPnd_Amt > v_AFSbs_Amt) AND (v_AFSbs_Amt <> 0) THEN
        v_AFPnd_Stat := 'R';
    ELSIF v_AFSbs_Amt = 0 THEN
        v_AFPnd_Stat := 'P';
    ELSE
        v_AFPnd_Stat := 'X'; --> 확인필요
    END IF;

    -- 선수금 발생내역 업데이트
    IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(v_BFRecv_Seq, v_BFRitm_Seq, v_AFSbs_Amt, v_AFPnd_Stat,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.p_InsertRtre0036CleanAdvance(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0036.p_InsertRtre0036CleanAdvance(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0036CleanAdvance;


END Pkg_Rtre0036;
/