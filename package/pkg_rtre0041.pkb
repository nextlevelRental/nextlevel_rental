CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0041 AS
/*******************************************************************************
   NAME      Pkg_Rtre0041
   PURPOSE   온라인 결제 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
   1.1        2019-10-30  kstka            [20191030_01] 사업자의 경우 사업자 SAFEKEY비교
   1.2        2020-01-16  kstka            [2020-00014827_01] 당월연체기준 변경
*******************************************************************************/

  /*****************************************************************************
  -- 온라인 결제 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0041Count(
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0041
    WHERE   RECV_SEQ = v_Recv_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0041Count;

  /*****************************************************************************
  -- 온라인 결제 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0041 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_AMT,                  /*수납금액            */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.TNO,                       /*PG거래번호          */
            A.CNC_RSEQ,                  /*수납취소거래번호    */
            A.CNC_STAT,                  /*수납취소여부        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0041 A
    WHERE   A.RECV_SEQ = DECODE(v_Recv_Seq , NULL, A.RECV_SEQ , v_Recv_Seq)
    AND     A.RECV_DAY = DECODE(v_Recv_Day , NULL, A.RECV_DAY , v_Recv_Day)
    AND     A.ORD_NO   = DECODE(v_Ord_No   , NULL, A.ORD_NO   , v_Ord_No)
    AND     A.CUST_NO  = DECODE(v_Cust_No  , NULL, A.CUST_NO  , v_Cust_No)
    AND     A.RECP_AMT = DECODE(v_Recp_Amt , NULL, A.RECP_AMT , v_Recp_Amt)
    AND     A.RECP_TP  = DECODE(v_Recp_Tp  , NULL, A.RECP_TP  , v_Recp_Tp)
    AND     A.RECP_PAY = DECODE(v_Recp_Pay , NULL, A.RECP_PAY , v_Recp_Pay)
    AND     A.RECP_FG  = DECODE(v_Recp_Fg  , NULL, A.RECP_FG  , v_Recp_Fg)
    AND     A.TNO      = DECODE(v_Tno      , NULL, A.TNO      , v_Tno)
--    AND     A.CNC_RSEQ = DECODE(v_Cnc_Rseq , NULL, A.CNC_RSEQ , v_Cnc_Rseq)
    AND     (v_Cnc_Rseq IS NULL OR A.CNC_RSEQ = v_Cnc_Rseq)
    AND     A.CNC_STAT = DECODE(v_Cnc_Stat , NULL, A.CNC_STAT , v_Cnc_Stat)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0041;

  /*****************************************************************************
  -- 온라인 결제 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0041 (
            RECV_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_AMT,
            RECP_TP,
            RECP_PAY,
            RECP_FG,
            TNO,
            CNC_RSEQ,
            CNC_STAT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Recv_Day,
            v_Ord_No,
            v_Cust_No,
            v_Recp_Amt,
            v_Recp_Tp,
            v_Recp_Pay,
            v_Recp_Fg,
            v_Tno,
            v_Cnc_Rseq,
            v_Cnc_Stat,
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

  END f_InsertRtre0041;

  /*****************************************************************************
  -- 온라인 결제 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0041
    SET    RECV_DAY = v_Recv_Day,
           ORD_NO   = v_Ord_No,
           CUST_NO  = v_Cust_No,
           RECP_AMT = v_Recp_Amt,
           RECP_TP  = v_Recp_Tp,
           RECP_PAY = v_Recp_Pay,
           RECP_FG  = v_Recp_Fg,
           TNO      = v_Tno,
           CNC_RSEQ = v_Cnc_Rseq,
           CNC_STAT = v_Cnc_Stat,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  RECV_SEQ = v_Recv_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0041;

  /*****************************************************************************
  -- 온라인 결제 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0041
    WHERE   RECV_SEQ = v_Recv_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_IUDRtre0041(2)', '수납거래번호', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_IUDRtre0041(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0041;

  /*****************************************************************************
  -- 온라인 결제 내역 관리- PG사 수납등록처리: 쇼핑몰에서 결제한 내역에 대하여 수납처리하는 함수
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041PgReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Chk_Cnt    NUMBER;
    v_Recv_Seq  RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호          */
    v_Recp_Tp   RTRE0041.RECP_TP%TYPE DEFAULT NULL;   /*청구구분              */
    v_Recp_Fg   RTRE0041.RECP_FG%TYPE DEFAULT NULL;   /*수납유형              */
    v_Cnc_Rseq  RTRE0041.CNC_RSEQ%TYPE DEFAULT NULL;  /*수납취소거래번호      */
    v_Cnc_Stat  RTRE0041.CNC_STAT%TYPE DEFAULT NULL;  /*수납취소여부          */
    v_Mfp_Yn    RTSD0108.MFP_YN%TYPE DEFAULT NULL;  /*중도완납여          */
    v_Rear_Amt      NUMBER DEFAULT 0;                 /*미납수납금액          */
    v_Pnd_Amt       NUMBER DEFAULT 0;                 /*선수금수납금액        */
    v_Rc_Amt        NUMBER DEFAULT 0;                 /*수납처리금액          */
    v_Recp_Amt_M    NUMBER DEFAULT 0;                 /*수납금액(잔액)        */


    v_Table_Count   NUMBER DEFAULT 0;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Loop_Count    NUMBER DEFAULT 0;

    e_Error EXCEPTION;

    Ref_Cursor SYS_REFCURSOR;
  BEGIN
  
    -- 필수값: 수납일자 , 계약번호 , 고객번호 ,수납금액 ,  수납방법 , 연체금액, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF v_Recv_Day > TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
        v_Return_Message := '현재일 이후 수납일자('||v_Recv_Day||')에 대하여 처리가 불가능합니다.!';
        RAISE e_Error;
    END IF;

    IF '01' = Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) THEN

        IF SUBSTR(v_Recv_Day,1,6) != TO_CHAR(SYSDATE, 'YYYYMM') AND v_Reg_Id != 'wjim' THEN

            v_Return_Message := '영업관리자는 수납일자('||v_Recv_Day||')에 대하여 당월까지만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Recv_Day != TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
            v_Return_Message := '수납일자('||v_Recv_Day||')는 당일이어야만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

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

--    IF TRIM(v_Recp_Id) IS NULL THEN
--        v_Return_Message := '수납자ID('||v_Recp_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

--DBMS_OUTPUT.PUT_LINE('00 v_Recp_Amt::'||v_Recp_Amt);  
    IF (TRIM(v_Recp_Amt) IS NULL) OR (TRIM(v_Recp_Amt) < 0) THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recp_Pay) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R019', v_Recp_Pay)) THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN

        IF 0 != ISDATE(v_Bank_Recp_Day) THEN
            v_Return_Message := '은행입금일('||v_Bank_Recp_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        IF TRIM(v_Tno) IS NULL THEN
            v_Return_Message := 'PG거래번호('||v_Tno||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSE
        -- C1:CMS이체 ,C2:카드이체
        v_Return_Message := '해당 수납방법('||v_Recp_Pay||')으로는 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--    IF TRIM(v_Arre_Amt) IS NULL THEN
--        v_Return_Message := '연체금액('||v_Arre_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 수납대상리스트 임시테이블 존재여부 확인
    SELECT COUNT(*)
    INTO   v_Table_Count
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    SELECT CASE WHEN B.MFP_YN IS NULL THEN 'N'
           ELSE B.MFP_YN END
    INTO   v_Mfp_Yn 
    FROM  RTSD0104 A
        , RTSD0108 B
    WHERE  1=1
      AND A.ORD_NO = B.ORD_NO(+)
      AND A.ORD_NO(+) = v_Ord_No;

    -- 수납대상리스트 임시테이블이 없으면
    IF (SQL%NOTFOUND) OR (v_Table_Count = 0) THEN

        -- 수납대상리스트 임시테이블 생성
        EXECUTE IMMEDIATE
        'CREATE GLOBAL TEMPORARY TABLE RTTEMP01 (
              ORD_NO        VARCHAR2(15 BYTE),
              SCHD_SEQ      NUMBER(3),
              RECP_TP       VARCHAR2(2 Byte),
              CUST_NO       VARCHAR2(10 BYTE),
              DEMD_DT       VARCHAR2(8 BYTE),
              ZFB_DAY       VARCHAR2(8 BYTE),
              SCD_STAT      VARCHAR2(1 BYTE),
              ZLSPR         VARCHAR2(1 BYTE),
              RC_YN         VARCHAR2(1 BYTE),
              USE_YN        CHAR(1 BYTE),
              SALE_AMT      NUMBER(10),
              RECP_AMT      NUMBER(10),
              ARRE_AMT      NUMBER(10),
              RECP_NU       NUMBER(3),
              RECA_AMT      NUMBER(10)
         ) ON COMMIT DELETE ROWS;
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''PG사 수납등록처리(Pkg_Rtre0041)시 사용 TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''계약번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_TP IS ''청구구분'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''고객번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.DEMD_DT IS ''청구일자'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ZFB_DAY IS ''만기계산기준일'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCD_STAT IS ''스케줄상태코드'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ZLSPR IS ''청구보류'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RC_YN IS ''수납여부'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.USE_YN IS ''사용여부'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SALE_AMT IS ''매출금액'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납금액'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''연체금액 '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_NU IS ''청구회차'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECA_AMT IS ''수납처리금액'';';

    END IF;


    -- 수납대상리스트 임시테이블에 생성
    INSERT INTO RTTEMP01
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*청구순번            */
            A.RECP_TP,                   /*청구구분            */
            A.CUST_NO,                   /*고객번호            */
            A.DEMD_DT,                   /*청구일자            */
            A.ZFB_DAY,                   /*만기계산기준일      */
            A.SCD_STAT,                  /*스케줄상태코드      */
            A.ZLSPR,                     /*청구보류            */
            A.RC_YN,                     /*수납여부            */
            A.USE_YN,                    /*사용여부            */
            A.SALE_AMT,                  /*매출금액(VAT 포함)  */
            A.RECP_AMT,                  /*수납금액(VAT포함)   */
            A.ARRE_AMT,                  /*연체금액(VAT포함)   */
            A.RECP_NU,                   /*청구회차            */
            0 RECA_AMT                   /*수납처리금액        */
    FROM    RTSD0109 A                   /*청구스케쥴          */
    WHERE   A.ORD_NO   = v_Ord_No        /*계약번호            */
    AND     A.CUST_NO  = v_Cust_No       /*고객번호            */
    AND     A.SCD_STAT = 'S'             /*스케줄상태코드      */
    AND     A.ZLSPR    = 'N'             /*청구보류            */
    AND     A.RC_YN    <> 'Y'            /*수납여부            */
    AND     A.USE_YN   = 'Y'             /*사용여부            */
    AND     A.ZFB_DAY  <= v_Recv_Day;    /*만기계산기준일:수납일이전까지 미납된  */

    -- 수납대상리스트가 없으면
    IF SQL%NOTFOUND THEN

        -- 수납금액을 모두 선수금으로 처리함
        v_Pnd_Amt := v_Recp_Amt;


        -- 수납대상리스트에  선수금 데이터 추가(수납금액을 수납처리금액 값에 설정하고 나머지는 NULL 처리함)
        INSERT INTO RTTEMP01
        SELECT v_Ord_No ORD_NO, NULL SCHD_SEQ, NULL RECP_TP, v_Cust_No CUST_NO, NULL DEMD_DT, NULL ZFB_DAY, NULL SCD_STAT,
               NULL ZLSPR, NULL RC_YN, NULL USE_YN, NULL SALE_AMT, NULL RECP_AMT, NULL ARRE_AMT, NULL RECP_NU, v_Pnd_Amt RECA_AMT
        FROM   DUAL;

        IF SQL%NOTFOUND THEN
            v_Return_Message := '수납대상리스트에 선수금 데이터 추가 실패!!';
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
        END IF;


    -- 수납대상리스트가 있으면
    ELSE
        -- 미납대상건수 = 수납대상리스트 생성건수
        v_Row_Count := SQL%ROWCOUNT;

        -- 수납금액(잔액) = 수납금액
        v_Recp_Amt_M := v_Recp_Amt;

        FOR CUR IN (SELECT  *
                    FROM    RTTEMP01 A
                    ORDER   BY A.ZFB_DAY, A.RECP_TP) LOOP

            v_Loop_Count := v_Loop_Count+1;

            -- 수납금액(잔액)  연체금액(미납금액)
            IF v_Recp_Amt_M >= NVL(CUR.ARRE_AMT,0) THEN

                v_Recp_Amt_M := v_Recp_Amt_M - NVL(CUR.ARRE_AMT,0);
                v_Rc_Amt := NVL(CUR.ARRE_AMT,0); /*수납처리금액        */
                --v_Pnd_Amt := NVL(CUR.ARRE_AMT,0); /*선수금수납금액        */

            ELSIF v_Recp_Amt_M < NVL(CUR.ARRE_AMT,0) AND v_Mfp_Yn = 'N' THEN

                v_Recp_Amt_M := 0;  -- 중도완납처리시 0원처리하면 수납불가 임준호
                v_Rc_Amt := v_Recp_Amt_M; /*수납처리금액        */
                --v_Pnd_Amt := v_Recp_Amt_M; /*선수금수납금액        */

            ELSIF v_Recp_Amt_M < NVL(CUR.ARRE_AMT,0) AND v_Mfp_Yn = 'Y' THEN

                --v_Recp_Amt_M := 0;  -- 중도완납처리시 0원처리하면 수납불가 임준호
                v_Rc_Amt := v_Recp_Amt_M; /*수납처리금액        */
                v_Pnd_Amt := 0;
                --v_Pnd_Amt := v_Recp_Amt_M; /*선수금수납금액        */

            END IF;

            -- 미납수납금액 =  수납처리금액의 합계
            --v_Rear_Amt := v_Rear_Amt + NVL(v_Pnd_Amt,0);
            v_Rear_Amt := v_Rear_Amt + NVL(v_Rc_Amt,0);

            -- 수납대상리스트에 수납처리금액 업데이트
            UPDATE RTTEMP01
            SET    RECA_AMT = v_Rc_Amt
            WHERE  ORD_NO   = CUR.ORD_NO
            AND    SCHD_SEQ = CUR.SCHD_SEQ;

            IF SQL%NOTFOUND THEN
                v_Return_Message := '미납리스트에 수납처리금액 업데이트 실패!!';
                v_ErrorText := SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END IF;

            -- 수납금액(잔액) 모두 소진되었으면 빠져나감
            IF v_Recp_Amt_M = 0 THEN
                EXIT;
            END IF;

            -- 마지막 데이터 이면
            IF v_Row_Count = v_Loop_Count THEN
                IF v_Mfp_Yn = 'N' THEN
                -- 수납대상리스트의 미납금액을 수납금액에서 차감해도 남는 금액은 선수금으로 처리
                    IF 0 < v_Recp_Amt_M THEN

                        -- 선수금수납금액 :  남은 금액을  모두 선수금으로 처리함
                        v_Pnd_Amt := v_Recp_Amt_M;
 
                        -- 수납대상리스트에  선수금 데이터 추가(수납금액을 수납처리금액 값에 설정하고 나머지는 NULL 처리함)
                        INSERT INTO RTTEMP01
                        SELECT v_Ord_No ORD_NO, NULL SCHD_SEQ, NULL RECP_TP, v_Cust_No CUST_NO, NULL DEMD_DT, NULL ZFB_DAY, NULL SCD_STAT,
                               NULL ZLSPR, NULL RC_YN, NULL USE_YN, NULL SALE_AMT, NULL RECP_AMT, NULL ARRE_AMT, NULL RECP_NU, v_Pnd_Amt RECA_AMT
                        FROM   DUAL;

                        IF SQL%NOTFOUND THEN
                            v_Return_Message := '미납리스트에 선수금 데이터 추가 실패!!';
                            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
                            RAISE e_Error;
                        END IF;

                    END IF;
                END IF;
            END IF;

        END LOOP;

    END IF;


    -- 3. 수납내역 생성처리

    -- 수납대상리스트 조회(미납리스트와 선수금 내역)
    OPEN  Ref_Cursor FOR
    SELECT  A.ORD_NO,               /*계약번호 */
            A.CUST_NO,              /*고객번호 */
            A.SCHD_SEQ,             /*청구순번 */
            A.ARRE_AMT,             /*미납금액 */
            A.RECA_AMT RECP_AMT     /*수납금액 */
    FROM    RTTEMP01 A
    WHERE   A.RECA_AMT > 0          /*수납금액이 존재하는 것만 */
    ORDER   BY A.ZFB_DAY, A.RECP_TP, NVL(A.SCHD_SEQ,999); -- 선수금을 무조건 마지막에 위치함.

    v_Recp_Fg   := '01';   /*수납유형:입금(01)     */

    -- 수납거래번호 채번
    v_Recv_Seq := f_sRtre0041RecvSeq();

    Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Recv_Day, v_Ord_No, v_Cust_No,
                                   v_Recp_Id, v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Recv_Seq,
                                   v_Rear_Amt, v_Pnd_Amt, v_Reg_Id, v_Success_Code,
                                   v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        v_Return_Message := '수납내역 생성처리 실패!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    -- 4. 수납처리 생성완료 후 수납방법에 따라 RTRE0040, RTRE0041에 INSERT 한다.
    -- 카드즉시출금내역 존재 여부
    SELECT NVL(COUNT(1), 0)
    INTO   v_Chk_Cnt
    FROM   RTRE0160
    WHERE  RECP_TRNO       = v_Tno
    AND    PRPT_CNC_STAT <> 'Y';
    

    -- 초기값 설정
    IF v_Chk_Cnt = 0 THEN
        v_Recp_Tp   := '90';   /*청구구분:선수금(90)   */
    ELSE
        v_Recp_Tp   := '51';   /*청구구분:선납할인(51)   */    
    END IF;   

    v_Cnc_Rseq  := NULL;   /*수납취소거래번호      */
    v_Cnc_Stat  := 'N';    /*수납취소여부          */

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG), P3:휴대폰(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN


        IF 0 != Pkg_Rtre0040.f_sRtre0040Count(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != Pkg_Rtre0040.f_InsertRtre0040(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Bank_Recp_Day,
                                              v_Cnc_Rseq, v_Cnc_Stat, v_Recp_Id, v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '무통장 수납내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        IF 0 != Pkg_Rtre0041.f_sRtre0041Count(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF 0 != Pkg_Rtre0041.f_InsertRtre0041(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Amt, v_Recp_Tp, v_Recp_Pay, v_Recp_Fg,
                                              v_Tno, v_Cnc_Rseq, v_Cnc_Stat, v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '온라인 결제 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041PgReceipt(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041PgReceipt(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0041PgReceipt;

  /*****************************************************************************
  -- 온라인 결제 내역 관리- 수납취소처리: 수납등록된 내역에 대하여 취소 처리 하는 기능임
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041RecCancel (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Cnc_Rseq  RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;  /*취소수납거래번호      */

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 수납일자 , 계약번호 , 고객번호 , 수납거래번호, 수납방법 , 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Recv_Day > TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
        v_Return_Message := '현재일 이후 수납일자('||v_Recv_Day||')에 대하여 처리가 불가능합니다.!';
        RAISE e_Error;
    END IF;

    IF '01' = Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) THEN

        IF ((SUBSTR(v_Recv_Day,1,6) != TO_CHAR(SYSDATE, 'YYYYMM')) AND (v_Reg_Id != 'wjim'))THEN

            v_Return_Message := '영업관리자는 수납일자('||v_Recv_Day||')에 대하여 당월까지만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;
        

    ELSE

        IF v_Recv_Day != TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
            v_Return_Message := '수납일자('||v_Recv_Day||')는 당일이어야만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

    END IF; 
    
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recp_Pay) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R019', v_Recp_Pay)) THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 

    -- 현금영수증 미발행건 취소 가능 , 발행건은 발행취소해야만 취소 가능
    IF 0 < Pkg_Rtre0030.f_sRtre0030CashYnCnt(v_Recv_Seq) THEN
        v_Return_Message := '현금영수증 발행건이 존재하므로 취소 불가능!.발행취소 후 취소 가능!';
        RAISE e_Error;
    END IF;

    -- 선수금 잔액 확인하여 취소금액보다 큰경우 취소 가능
    -- 계약번호/고객번호 기준 선수금 잔액(합산) 획득 <  수납거래번호로 선수금(합계) 획득
    IF Pkg_Rtre0035.f_sRtre0035BalanceAmt(v_Ord_No, v_Cust_No) < Pkg_Rtre0030.f_sRtre0030RecpAmtSum(v_Recv_Seq) THEN
        v_Return_Message := '취소금액이 선수금 잔액보다 크므로 처리가 불가능합니다.확인 바랍니다.!';
        RAISE e_Error;
    END IF;

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG), P3:휴대폰(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN

        -- 무통장 수납내역 - 취소가능여부 판단 - 취소가능상태 건수 획득
        IF 0 = Pkg_Rtre0040.f_sRtre0040CncCount(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 취소가능한 데이터(RTRE0040)가 존재하지 않으므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        -- 온라인 결제 내역 - 취소가능여부 판단 - 취소가능상태 건수 획득
        IF 0 = Pkg_Rtre0041.f_sRtre0041CncCount(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 취소가능한 데이터(RTRE0041)가 존재하지 않으므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '수납방법이 A1:무통장,P1:카드(PG) ,P2:계좌이체(PG), P3:휴대폰(PG) 외에는 처리가 불가합니다.!';
        RAISE e_Error;

    END IF;



    -- 수납취소거래번호 채번
    v_Cnc_Rseq := f_sRtre0041RecvSeq();

    -- 수납 내역 관리 - 수납취소처리:수납내역생성처리
    Pkg_Rtre0030.p_InsertRtre0030Cancel(v_Recv_Day, v_Recv_Seq, v_Ord_No, v_Cust_No, v_Cnc_Rseq, v_Reg_Id, v_Success_Code,
                                        v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '수납취소처리 실패!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    -- 수납방법에 따라 원거래 수납 수정( RTRE0040, RTRE0041)

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG), P3:휴대폰(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN

        -- 무통장 수납내역 - 수납취소 - 원거래수납수정 (DEFAULT VALUE : v_Recp_Fg = '11', v_Cnc_Stat = 'Y')
        IF 0 != Pkg_Rtre0040.f_UpdateRtre0040Cancel(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                                    '11', v_Cnc_Rseq, 'Y', v_Reg_Id,
                                                    v_ErrorText) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 원거래 수납(RTRE0040) 수정시 에러 발생!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        -- 온라인 결제 내역 - 수납취소 - 원거래수납수정 (DEFAULT VALUE : v_Recp_Fg = '11', v_Cnc_Stat = 'Y')
        IF 0 != Pkg_Rtre0041.f_UpdateRtre0041Cancel(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                                    '11', v_Cnc_Rseq, 'Y', v_Reg_Id,
                                                    v_ErrorText) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 원거래 수납(RTRE0041) 수정시 에러 발생!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041RecCancel(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041RecCancel(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0041RecCancel;

  /*****************************************************************************
  -- 온라인 결제 내역 - 수납거래번호 체번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0041RecvSeq RETURN NUMBER IS
    v_Recv_Seq  RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;     /*수납거래번호        */
  BEGIN
    -- 거래일련번호 시퀀스 같이 사용함
    SELECT  SEQ_Rtre0030Recv_Seq.NEXTVAL RPC_SEQ
    INTO    v_Recv_Seq
    FROM    DUAL;

    RETURN v_Recv_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0041RecvSeq;

  /*****************************************************************************
  -- 온라인 결제 내역 - 취소가능여부 판단 - 취소가능상태 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtre0041CncCount(
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0041
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CNC_RSEQ IS NULL -- 수납취소거래번호
    AND     CNC_STAT = 'N';  -- 수납취소여부

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0041CncCount;

  /*****************************************************************************
  -- 온라인 결제 내역 - 수납취소 - 원거래수납수정
  *****************************************************************************/
  FUNCTION f_UpdateRtre0041Cancel (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS


  BEGIN

    UPDATE RTRE0041
    SET    CNC_RSEQ = v_Cnc_Rseq,
           CNC_STAT = v_Cnc_Stat,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  RECV_SEQ = v_Recv_Seq;

    IF 0 = SQL%ROWCOUNT THEN
        v_ErrorText := '해당건('||v_Recv_Seq||')으로 등록된 데이터(온라인 결제 내역:RTRE0041)이 존재하지 않아 취소처리가 불가 합니다!';
        RETURN -1;
    END IF;

    INSERT  INTO RTRE0041 (
            RECV_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_AMT,
            RECP_TP,
            RECP_PAY,
            RECP_FG,
            TNO,
            CNC_RSEQ,
            CNC_STAT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  v_Cnc_Rseq RECV_SEQ,
            v_Recv_Day RECV_DAY,
            v_Ord_No ORD_NO,
            v_Cust_No CUST_NO,
            - RECP_AMT,
            RECP_TP,
            RECP_PAY,
            v_Recp_Fg RECP_FG,
            TNO,
            v_Recv_Seq CNC_RSEQ,
            v_Cnc_Stat CNC_STAT,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0041
    WHERE   RECV_SEQ = v_Recv_Seq;

    IF 0 = SQL%ROWCOUNT THEN
        v_ErrorText := '해당건('||v_Cnc_Rseq||')으로 취소 데이터(온라인 결제 내역:RTRE0041) 0건으로 등록에 실패하였습니다.!';
        RETURN -1;
    END IF;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0041Cancel;
  
  /*****************************************************************************
  -- 쇼핑몰 당월 청구내역조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041RecvThisMonList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE         /*세이프키              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
        SELECT  NVL( D.ORD_NO, B.ORD_NO ) AS ORD_NO,            -- 계약번호
                (SELECT
                    REPLACE(LISTAGG(C.MAT_CD, ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
                FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_CD,               -- 제품코드
                (SELECT
                    REPLACE(LISTAGG(Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ), ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
                 FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_NM,              -- 제품명
                NVL( D.CAR_NO, B.CAR_NO ) AS CAR_NO,                                -- 차량번호
                NVL( D.CNT_CD, B.CNT_CD ) AS CNT_CD,                                -- 본수
                B.PERIOD_CD,                                                        -- 계약기간
                NVL( D.PAY_MTHD, B.PAY_MTHD ) AS PAY_MTHD,                          -- 납부유형
                Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', NVL( D.PAY_MTHD, B.PAY_MTHD ) ) AS PAY_NM,    -- 납부유형명            
                B.SUM_MON_AMT             AS  ARRE_AMT,                             -- 청구금액
                (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD,  --판매상품코드
                (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM   --판매상품명
        FROM    RTSD0100 A,
                RTSD0104 B,
                RTSD0108 D
        WHERE   1=1
        AND     NVL(A.SAFEKEY, A.O_SAFEKEY)  = v_Safe_Key
        AND     B.STAT_CD  = '04'
        AND     A.CUST_NO  = B.CUST_NO
        AND     B.ORD_NO   = D.ORD_NO(+)
        AND     TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(D.PROC_DAY, 0, 4) || '/' || SUBSTR(D.PROC_DAY, 5, 2) || '/' || SUBSTR(D.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) - 1, D.PERIOD_CD), 'yyyymmdd') >= TO_CHAR(SYSDATE, 'YYYYMMDD');    
--    
--    SELECT  NVL( D.ORD_NO, B.ORD_NO ) AS ORD_NO,            -- 계약번호
--            (SELECT
--                REPLACE(LISTAGG(C.MAT_CD, ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
--            FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_CD,               -- 제품코드
--            (SELECT
--                REPLACE(LISTAGG(Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ), ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
--             FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_NM,              -- 제품명
--            NVL( D.CAR_NO, B.CAR_NO ) AS CAR_NO,                                -- 차량번호
--            NVL( D.CNT_CD, B.CNT_CD ) AS CNT_CD,                                -- 본수
--            B.PERIOD_CD,                                                        -- 계약기간
--            NVL( D.PAY_MTHD, B.PAY_MTHD ) AS PAY_MTHD,                          -- 납부유형
--            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', NVL( D.PAY_MTHD, B.PAY_MTHD ) ) AS PAY_NM,    -- 납부유형명            
--            E.ARRE_AMT,                                                          -- 청구금액
--            (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD,  --판매상품코드
--            (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM   --판매상품명
--    FROM    RTSD0100 A,
--            RTSD0104 B,
--            RTSD0108 D,
--            RTSD0109 E
--    WHERE   1=1
--    AND     A.SAFEKEY  = v_Safe_Key
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     B.ORD_NO   = E.ORD_NO
--    AND     SUBSTR(E.ZFB_DAY, 1,6) = TO_CHAR(SYSDATE, 'YYYYMM')      
--    AND     B.ORD_NO   = D.ORD_NO(+);

  END p_sRtre0041RecvThisMonList;  
  
  /*****************************************************************************
  -- 쇼핑몰 전월 청구내역조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041RecvPrvsMonList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE,         /*세이프키              */
    v_Start_Day      IN RTRE0030.RECV_DAY%TYPE,        /* 시작일자 */
    v_End_Day        IN RTRE0030.RECV_DAY%TYPE         /* 종료일자 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  NVL( D.ORD_NO, B.ORD_NO ) AS ORD_NO,            -- 계약번호
            (SELECT
                REPLACE(LISTAGG(C.MAT_CD, ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
            FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_CD,               -- 제품코드
            (SELECT
                REPLACE(LISTAGG(Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ), ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
             FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_NM,              -- 제품명
            NVL( D.CAR_NO, B.CAR_NO ) AS CAR_NO,                                -- 차량번호
            NVL( D.CNT_CD, B.CNT_CD ) AS CNT_CD,                                -- 본수
            B.PERIOD_CD,                                                        -- 계약기간
            E.RECP_AMT,                                                          -- 청구금액
            E.RECV_DAY,
            B.PAY_DD,                                                           -- 결제임
            CASE WHEN E.RECP_PAY = 'C1' THEN (SELECT PKG_RTCM0051.f_sRtcm0051CodeName('R001', BANK_CD) FROM RTRE0010 WHERE CUST_NO = B.CUST_NO AND USE_YN = 'Y' AND ACC_CHK = 'Y' AND ROWNUM = 1 )
                 WHEN E.RECP_PAY = 'C2' THEN (SELECT PKG_RTCM0051.f_sRtcm0051CodeName('R002', CARDCOM_CD) FROM RTRE0020 WHERE CUST_NO = A.CUST_NO AND USE_YN = 'Y'AND BKEY_CHK = 'Y' AND ROWNUM = 1)
                 WHEN E.RECP_PAY = 'P1' THEN (SELECT H3.CARDCOM_NM FROM RTRE0041 H1, RTRE0043 H3 WHERE H1.TNO = H3.TNO AND H1.ORD_NO = E.ORD_NO )
                 WHEN E.RECP_PAY = 'P2' THEN ''
                 WHEN E.RECP_PAY = 'P4' THEN (SELECT PKG_RTCM0051.f_sRtcm0051CodeName('R001', BANK_CD) FROM RTRE0140 WHERE CUST_NO = B.CUST_NO AND TORD_NO = B.ORD_NO AND RECV_SEQ = E.RECV_SEQ AND RQST_STAT = '6')
                 WHEN E.RECP_PAY = 'P5' THEN (SELECT PKG_RTCM0051.f_sRtcm0051CodeName('R001', BANK_CD) FROM RTRE0220 WHERE CUST_NO = B.CUST_NO AND TORD_NO = B.ORD_NO AND RECV_SEQ = E.RECV_SEQ AND RQST_STAT = '6')
                 WHEN E.RECP_PAY = 'P6' THEN (SELECT PKG_RTCM0051.f_sRtcm0051CodeName('R001', BNK_CD) FROM RTRE0210 F1, RTRE0212 F2 WHERE F1.TNO = F2.TNO AND F1.CUST_NO = E.CUST_NO AND F1.TORD_NO = E.ORD_NO AND F1.RECV_SEQ = E.RECV_SEQ)
                 WHEN E.RECP_PAY = 'P7' THEN (SELECT PKG_RTCM0051.f_sRtcm0051CodeName('R002', CRD_CD) FROM RTRE0200 G1, RTRE0202 G2 WHERE G1.TNO = G2.TNO AND G1.CUST_NO = E.CUST_NO AND G1.TORD_NO = E.ORD_NO AND G1.RECV_SEQ = E.RECV_SEQ)
            END AS BANK_NM,
            CASE WHEN E.RECP_PAY = 'C1' THEN (SELECT ACCT_NO FROM RTRE0010 WHERE CUST_NO = B.CUST_NO AND USE_YN = 'Y' AND ACC_CHK = 'Y' AND ROWNUM = 1 )
                 WHEN E.RECP_PAY = 'C2' THEN (SELECT CARD_NO FROM RTRE0020 WHERE CUST_NO = A.CUST_NO AND USE_YN = 'Y'AND BKEY_CHK = 'Y' AND ROWNUM = 1)
                 WHEN E.RECP_PAY = 'P1' THEN (SELECT H2.CRD_NO FROM RTRE0041 H1, RTRE0042 H2 WHERE H1.TNO = H2.TNO AND H1.CUST_NO = E.CUST_NO AND H1.ORD_NO = E.ORD_NO AND H1.RECV_SEQ = E.RECV_SEQ)
                 WHEN E.RECP_PAY = 'P2' THEN (SELECT I2.CRD_NO FROM RTRE0041 I1, RTRE0042 I2 WHERE I1.TNO = I2.TNO AND I1.CUST_NO = E.CUST_NO AND I1.ORD_NO = E.ORD_NO AND I1.RECV_SEQ = E.RECV_SEQ)
                 WHEN E.RECP_PAY = 'P4' THEN (SELECT VACCOUNT FROM RTRE0140 WHERE CUST_NO = B.CUST_NO AND TORD_NO = B.ORD_NO AND RECV_SEQ = E.RECV_SEQ AND RQST_STAT = '6')
                 WHEN E.RECP_PAY = 'P5' THEN (SELECT VACCOUNT FROM RTRE0220 WHERE CUST_NO = B.CUST_NO AND TORD_NO = B.ORD_NO AND RECV_SEQ = E.RECV_SEQ AND RQST_STAT = '6')
                 WHEN E.RECP_PAY = 'P6' THEN (SELECT F2.BNK_NO FROM RTRE0210 F1, RTRE0212 F2 WHERE F1.TNO = F2.TNO AND F1.CUST_NO = E.CUST_NO AND F1.TORD_NO = E.ORD_NO AND F1.RECV_SEQ = E.RECV_SEQ)
                 WHEN E.RECP_PAY = 'P7' THEN (SELECT CRD_NO FROM RTRE0200 G1, RTRE0202 G2 WHERE G1.TNO = G2.TNO AND G1.CUST_NO = E.CUST_NO AND G1.TORD_NO = E.ORD_NO AND G1.RECV_SEQ = E.RECV_SEQ)
            END AS ACC_NO,  
            CASE WHEN E.RECP_PAY = 'C1' THEN (SELECT CUST_NM FROM RTRE0010 WHERE CUST_NO = B.CUST_NO AND USE_YN = 'Y' AND ACC_CHK = 'Y' AND ROWNUM = 1 )
                 WHEN E.RECP_PAY = 'C2' THEN (SELECT CUST_NM FROM RTRE0020 WHERE CUST_NO = A.CUST_NO AND USE_YN = 'Y'AND BKEY_CHK = 'Y' AND ROWNUM = 1)
                 WHEN E.RECP_PAY = 'P1' THEN (SELECT H3.CUST_NM FROM RTRE0041 H1, RTRE0043 H3 WHERE H1.TNO = H3.TNO AND H1.ORD_NO = E.ORD_NO )
                 WHEN E.RECP_PAY = 'P2' THEN ''
                 WHEN E.RECP_PAY = 'P4' THEN (SELECT CUST_NM FROM RTRE0140 WHERE CUST_NO = B.CUST_NO AND TORD_NO = B.ORD_NO AND RECV_SEQ = E.RECV_SEQ AND RQST_STAT = '6')
                 WHEN E.RECP_PAY = 'P5' THEN (SELECT CUST_NM FROM RTRE0220 WHERE CUST_NO = B.CUST_NO AND TORD_NO = B.ORD_NO AND RECV_SEQ = E.RECV_SEQ AND RQST_STAT = '6')
                 WHEN E.RECP_PAY = 'P6' THEN (SELECT F2.CUST_NM FROM RTRE0210 F1, RTRE0212 F2 WHERE F1.TNO = F2.TNO AND F1.CUST_NO = E.CUST_NO AND F1.TORD_NO = E.ORD_NO AND F1.RECV_SEQ = E.RECV_SEQ)
                 WHEN E.RECP_PAY = 'P7' THEN ''
            END AS CUST_NM                   
    FROM    RTSD0100 A,
            RTSD0104 B,
            RTSD0108 D,
            RTRE0030 E
    WHERE   1=1
    AND     NVL(A.SAFEKEY, A.O_SAFEKEY)  = v_Safe_Key   --[20191030_01] 사업자의 경우 사업자 SAFEKEY비교
    --AND     A.CUST_NO = '1000076871'
    AND     A.CUST_NO  = B.CUST_NO
    AND     B.ORD_NO   = E.ORD_NO
    AND     E.RECP_AMT > 0
    AND     E.CNC_STAT = 'N'
    AND     E.RECV_DAY BETWEEN v_Start_Day AND v_End_Day      
    AND     B.ORD_NO   = D.ORD_NO(+);

  END p_sRtre0041RecvPrvsMonList;   
  
  /*****************************************************************************
  -- 쇼핑몰 연체내역조회
  1.2        2020-01-16  kstka            [2020-00014827_01] 당월연체기준 변경
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE         /*세이프키              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT ORD_NO                       -- 계약번호
         , MAT_CD                       -- 제품코드
         , MAT_NM                       -- 제품명
         , CAR_NO                       -- 차량번호
         , CNT_CD                       -- 본수
         , PERIOD_CD                    -- 계약기간
         , PAY_MTHD                     -- 납부유형
         , PAY_NM                       -- 납부유형명  
         , SUM(ARRE_AMT) AS ARRE_AMT    -- 연체금액
         , SALE_CD                      -- 판매상품코드
         , SALE_NM                      -- 판매상품명
     FROM (
            SELECT  NVL( D.ORD_NO, B.ORD_NO ) AS ORD_NO,            -- 계약번호
                    (SELECT
                        REPLACE(LISTAGG(C.MAT_CD, ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
                    FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_CD,               -- 제품코드
                    (SELECT
                        REPLACE(LISTAGG(Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ), ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
                     FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_NM,              -- 제품명
                    NVL( D.CAR_NO, B.CAR_NO ) AS CAR_NO,                                -- 차량번호
                    NVL( D.CNT_CD, B.CNT_CD ) AS CNT_CD,                                -- 본수
                    B.PERIOD_CD,                                                        -- 계약기간
                    NVL( D.PAY_MTHD, B.PAY_MTHD ) AS PAY_MTHD,                          -- 납부유형
                    Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', NVL( D.PAY_MTHD, B.PAY_MTHD ) ) AS PAY_NM,    -- 납부유형명            
                    E.ARRE_AMT,                                                          -- 청구금액
                    (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD,  --판매상품코드
                    (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM   --판매상품명
            FROM    RTSD0100 A,
                    RTSD0104 B,
                    RTSD0108 D,
                    RTSD0109 E
            WHERE   1=1
            AND     A.SAFEKEY  = v_Safe_Key
            --AND     A.CUST_NO = '1000076871'
            AND     A.CUST_NO  = B.CUST_NO
            AND     B.ORD_NO   = E.ORD_NO
            AND     E.ZFB_DAY  < TO_CHAR(SYSDATE, 'YYYYMMDD')      --[2020-00014827_01]
            AND     B.ORD_NO   = D.ORD_NO(+)
--            AND     D.END_TP IS NULL
            AND     E.SCD_STAT = 'S'
            AND     E.ZLSPR    = 'N'             
            AND     E.RC_YN    <> 'Y'            
            AND     E.USE_YN   = 'Y'    
            AND     E.ARRE_AMT > 0          
         )
     WHERE 1=1
     GROUP BY ORD_NO, MAT_CD, MAT_NM, CAR_NO, CNT_CD, PERIOD_CD, PAY_MTHD, PAY_NM, SALE_CD, SALE_NM;

  END p_sRtre0041ArreList; 
  
  /*****************************************************************************
  -- 쇼핑몰 연체내역상세조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreDtlList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0109.ORD_NO%TYPE         /*세이프키              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT ORD_NO           -- 계약번호
         , ZFB_DAY          -- 연체일/ 청구일자
         , RECP_NU          -- 청구회차
         , SALE_AMT         -- 청구금액
         , ARRE_AMT         -- 미납금액
         , RECP_AMT         -- 수납금액
         , RC_DAY           -- 최종수납일
         , PAY_DD           -- 결제일
      FROM RTSD0109
     WHERE 1=1
       AND ORD_NO = v_Ord_No
       AND ARRE_AMT > 0
       AND SCD_STAT = 'S'
       AND ZLSPR    = 'N'             
       AND RC_YN    <> 'Y'            
       AND USE_YN   = 'Y'       
       AND ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
     ORDER BY  ZFB_DAY ASC ;

  END p_sRtre0041ArreDtlList;  
  
  /*****************************************************************************
  -- 쇼핑몰 연체내역상세조회(O2O연계)
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreDtlListNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0109.ORD_NO%TYPE,         /*세이프키              */
    v_Str_Day      IN RTSD0109.ZFB_DAY%TYPE,
    v_End_Day      IN RTSD0109.ZFB_DAY%TYPE
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.ORD_NO           -- 계약번호
         , A.ZFB_DAY          -- 연체일/ 청구일자
         , A.RECP_NU          -- 청구회차
         , A.SALE_AMT         -- 청구금액
         , A.ARRE_AMT         -- 미납금액
         , A.RECP_AMT         -- 수납금액
         , A.RC_DAY           -- 최종수납일
         , A.PAY_DD           -- 결제일
         , A.PAY_MTHD         -- 결제수단
         , Pkg_Rtcm0051.f_sRtcm0051Codename('R004', A.PAY_MTHD)     PAY_MTHD_NM --결제수단명
      FROM RTSD0109 A, RTSD0108 B
     WHERE 1=1
       AND A.ORD_NO = B.ORD_NO
       AND A.ORD_NO = DECODE(v_Ord_No , NULL, A.ORD_NO , v_Ord_No)
--       AND A.ARRE_AMT > 0
       AND A.SCD_STAT = 'S'
       AND A.ZLSPR    = 'N'             
--       AND A.RC_YN    <> 'Y'            
       AND A.USE_YN   = 'Y'       
       AND (v_Str_Day IS NULL OR A.ZFB_DAY BETWEEN DECODE(v_Str_Day, NULL, B.PROC_DAY, v_Str_Day) AND DECODE(v_End_Day, NULL, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_End_Day))
     ORDER BY  A.ZFB_DAY ASC ;

  END p_sRtre0041ArreDtlListNew;  

  /*****************************************************************************
  -- 온라인 중도완납 결제 내역 관리- PG사 수납등록처리: 쇼핑몰에서 결제한 중도완납금액을 처리하는 함수(중도해지는 정책상 불가)
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041MfpPgReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
--    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Balance_Amt    IN RTSD0109.ARRE_AMT%TYPE,       /*선납금액            */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*할인미대상            */
    v_Sale_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*총렌탈금액            */
    v_Recv_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*총수납금액(기존수납액) */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Recv_Seq  RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호          */
    v_Mfp_Seq   RTRE0230.MFP_SEQ%TYPE DEFAULT NULL;  /*중도완납순번          */
    v_Proc_Day  RTSD0108.PROC_DAY%TYPE DEFAULT NULL;  /*장착일자          */
--    v_Recp_Tp   RTRE0041.RECP_TP%TYPE DEFAULT NULL;   /*청구구분              */
--    v_Recp_Fg   RTRE0041.RECP_FG%TYPE DEFAULT NULL;   /*수납유형              */
--    v_Cnc_Rseq  RTRE0041.CNC_RSEQ%TYPE DEFAULT NULL;  /*수납취소거래번호      */
--    v_Cnc_Stat  RTRE0041.CNC_STAT%TYPE DEFAULT NULL;  /*수납취소여부          */
    
    v_Cust_No        RTRE0041.CUST_NO%TYPE;        /*고객번호              */

--    v_Rear_Amt      NUMBER DEFAULT 0;                 /*미납수납금액          */
--    v_Pnd_Amt       NUMBER DEFAULT 0;                 /*선수금수납금액        */
--    v_Rc_Amt        NUMBER DEFAULT 0;                 /*수납처리금액          */
--    v_Recp_Amt_M    NUMBER DEFAULT 0;                 /*수납금액(잔액)        */


--    v_Table_Count   NUMBER DEFAULT 0;
--    v_Row_Count     NUMBER DEFAULT 0;
--    v_Loop_Count    NUMBER DEFAULT 0;

    e_Error EXCEPTION;

    Ref_Cursor SYS_REFCURSOR;
  BEGIN

    -- 필수값: 수납일자 , 계약번호 , 고객번호 ,수납금액 ,  수납방법 , 연체금액, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Recv_Day > TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
        v_Return_Message := '현재일 이후 수납일자('||v_Recv_Day||')에 대하여 처리가 불가능합니다.!';
        RAISE e_Error;
    END IF;

    IF '01' = Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) THEN

        IF SUBSTR(v_Recv_Day,1,6) != TO_CHAR(SYSDATE, 'YYYYMM') AND v_Reg_Id != 'rosso203' THEN
            v_Return_Message := '영업관리자는 수납일자('||v_Recv_Day||')에 대하여 당월까지만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Recv_Day != TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
            v_Return_Message := '수납일자('||v_Recv_Day||')는 당일이어야만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_End_Tp) IS NULL THEN
        v_Return_Message := '종료유형('||v_End_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cancl_Day) IS NULL THEN
        v_Return_Message := '중도완납일자('||v_Cancl_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    

    IF TRIM(v_Balance_Amt) IS NULL THEN
        v_Return_Message := '선납금액('||v_Balance_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Arre1_Amt) IS NULL THEN
        v_Return_Message := '할인미대상 금액('||v_Arre1_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Sale_Amt) IS NULL THEN
        v_Return_Message := '총렌탈금액('||v_Sale_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Recv_Amt) IS NULL THEN
        v_Return_Message := '총수납금액(기존수납액)('||v_Recv_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;                

--    IF TRIM(v_Cust_No) IS NULL THEN
--        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

--    IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN

--        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
--            v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;
--    END IF;

--    IF TRIM(v_Recp_Id) IS NULL THEN
--        v_Return_Message := '수납자ID('||v_Recp_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

    IF (TRIM(v_Recp_Amt) IS NULL) OR (TRIM(v_Recp_Amt) < 0) THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recp_Pay) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R019', v_Recp_Pay)) THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN

        IF 0 != ISDATE(v_Bank_Recp_Day) THEN
            v_Return_Message := '은행입금일('||v_Bank_Recp_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        IF TRIM(v_Tno) IS NULL THEN
            v_Return_Message := 'PG거래번호('||v_Tno||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSE
        -- C1:CMS이체 ,C2:카드이체
        v_Return_Message := '해당 수납방법('||v_Recp_Pay||')으로는 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--    IF TRIM(v_Arre_Amt) IS NULL THEN
--        v_Return_Message := '연체금액('||v_Arre_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --고객번호 획득
    v_Cust_No := Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No);


                 
    -- 수납거래번호 채번
    --v_Recv_Seq := Pkg_Rtre0041.f_sRtre0041RecvSeq();

    --v_Prpt_Seq := f_sRtre0160PrptSeq();
    
    -- 중도완납 정보 처리
    Pkg_Rtsd0109.p_InsertRtsd0109CancelSave2 (v_Ord_No, v_End_Tp, v_Cancl_Day, v_Recp_Amt + v_Balance_Amt,
                                   v_Arre1_Amt, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                                   

    IF 0 != v_Success_Code THEN
        v_Return_Message := '중도완납 정보 처리 실패!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;                    

    -- 온라인 수납처리
    Pkg_Rtre0041.p_InsertRtre0041PgReceipt (v_Recv_Day, v_Ord_No, v_Cust_No, v_Recp_Id, 
                                   v_Recp_Amt, v_Recp_Pay, v_Arre_Amt, v_Bank_Recp_Day,
                                   v_Tno, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);                                           
                                       
    IF 0 != v_Success_Code THEN
        v_Return_Message := '중도완납 온라인 수납처리 실패!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;                       

    -- 중도완납 순번채번               
    v_Mfp_Seq := Pkg_Rtre0230.f_sRtre0230MfpSeq();                    
      
    -- 장착일 수납순번가져오기
    SELECT A.PROC_DAY
         , B.RECV_SEQ
    INTO v_Proc_Day, v_Recv_Seq
      FROM RTSD0108 A
         , RTRE0041 B
     WHERE 1=1
       AND A.ORD_NO = B.ORD_NO
       AND A.ORD_NO = v_Ord_No
       AND B.TNO    = v_Tno
       AND B.RECV_DAY = v_Recv_Day;
    
    -- 중도완납 이력저장  (장착일 가져와서 넣기)
    Pkg_Rtre0230.p_InsertRtsd0230MidFullPymnt (v_Mfp_Seq, v_Ord_No, v_Cust_No, v_Recv_Day, 
                                   SUBSTR(v_Recv_Day, 1,6), v_End_Tp, v_Proc_Day, v_Sale_Amt
                                   ,v_Recv_Amt, v_Balance_Amt,0, v_Recp_Amt, ROUND(v_Recp_Amt/v_Sale_Amt)
                                   , v_Recp_Pay,v_Recv_Seq, '01', '', v_Reg_Id, v_Success_Code
                                   , v_Return_Message, v_ErrorText);
                                
    IF 0 != v_Success_Code THEN
        v_Return_Message := '온라인 중도완납 이력저장 실패!!'||'-'||v_Return_Message;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041MfpPgReceipt(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041MfpPgReceipt(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0041MfpPgReceipt;


  /*****************************************************************************
  --쇼핑몰 연체금 상세정보
  *****************************************************************************/
  PROCEDURE sRtre0041ShopOverdueInfo (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE         /* 계약번호              */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT
      AA.ORD_NO                                              /* 주문번호 */
      ,AA.PETTERN_CD                                         /* 패턴코드 */
      ,AA.SIZE_INFO                                          /* 사이즈정보 */
      ,AA.MAKER_NM                                           /* 제조사 */
      ,AA.MODEL_NM                                           /* 차량모델 */
      ,AA.CONTENTS_CD                                        /* 사양 */
      ,AA.CNT_NM                                             /* 본수 */
      ,AA.PERIOD_NM                                          /* 기간 */
      ,AA.CAR_NO                                             /* 차량번호 */
      ,AA.CHAN_NM                                            /* 온/오프라인 */
      ,AA.PROC_DAY                                           /* 장착일자 */
      ,AA.OS_DAY                                             /* 소유권도래일 */
      ,LENGTH(AA.CARD_NO)
      ,CASE WHEN AA.BANK_NM IS NULL THEN AA.CARDCOM_NM  
       ELSE AA.BANK_NM
       END AS BANK_CARD_NM                                   /* 은행/카드사 */
      ,CASE WHEN AA.BANK_NM IS NULL THEN SUBSTR(AA.CARD_NO ,1,4)||LPAD('*',LENGTH(AA.CARD_NO)-8,'*')||SUBSTR(AA.CARD_NO,LENGTH(AA.CARD_NO)-20,4)
       ELSE SUBSTR(AA.ACCT_NO ,1,4)||LPAD('*',LENGTH(AA.ACCT_NO)-2,'*')||SUBSTR(AA.ACCT_NO,LENGTH(AA.ACCT_NO),1) 
       END AS BANK_CARD_NO                                   /* 계좌/카드번호 */
      ,CASE WHEN AA.BANK_NM IS NULL THEN AA.CARD_OWNER 
       ELSE AA.BANK_OWNER
       END AS BANK_CARD_OWNER                                /* 소유주 */
      ,AA.PAY_DD                                             /* 결제일 */
      ,AA.ORD_DAY                                            /* 계약일자 */
      ,AA.ARRE_MON                                           /* 연체기간 */
    FROM (  
        SELECT B.ORD_NO
             ,(SELECT T.MAT_CD FROM RTSD0005 T WHERE T.MAT_CD = C.MAT_CD) AS MAT_CD
             ,(SELECT T.PETTERN_CD FROM RTSD0005 T WHERE T.MAT_CD = C.MAT_CD) AS PETTERN_CD
             ,(SELECT T.SECTION_WIDTH||'/'||T.ASPECT_RATIO||'R'||T.WHEEL_INCHES FROM RTSD0005 T WHERE T.MAT_CD = C.MAT_CD) AS SIZE_INFO
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S001', B.MAKER_CD) AS MAKER_NM
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', B.MODEL_CD) AS MODEL_NM
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', B.CONTENTS_CD) AS CONTENTS_CD
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', C.CNT_CD) AS CNT_NM
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', C.PERIOD_CD) AS PERIOD_NM
             ,B.CAR_NO
             ,DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM       /*온라인,오프라인    */
             ,SUBSTR(B.PROC_DAY,1,4)||'.'||SUBSTR(B.PROC_DAY,5,2)||'.'||SUBSTR(B.PROC_DAY,7,2) AS PROC_DAY /* 장착일자 */
             ,SUBSTR(D.OS_DAY,1,4)||'.'||SUBSTR(D.OS_DAY,5,2)||'.'||SUBSTR(D.OS_DAY,7,2) AS OS_DAY /* 소유권 도래일 */
             ,Pkg_Rtcm0051.f_sRtcm0051Codename('R001', E.BANK_CD)      BANK_NM       /*은행이름           */
             ,Pkg_Rtcm0051.f_sRtcm0051Codename('R002', F.CARDCOM_CD)   CARDCOM_NM    /*카드사이름         */
             ,E.ACCT_NO                                                ACCT_NO       /*계좌번호           */
             ,F.CARD_NO                                                CARD_NO       /*카드번호           */
             ,E.CUST_NM                                                BANK_OWNER    /*예금주             */
             ,F.CUST_NM                                                CARD_OWNER    /*카드소유주         */
             ,D.PAY_DD                                                               /* 결제일 */
             ,SUBSTR(D.ORD_DAY,1,4)||'.'||SUBSTR(D.ORD_DAY,5,2)||'.'||SUBSTR(D.ORD_DAY,7,2) AS ORD_DAY  /*계약일자          */
             ,NVL( (  SELECT  MAX(COUNT(*))
                        FROM    RTSD0109 X
                       WHERE   X.ORD_NO = B.ORD_NO
                         AND    X.ARRE_AMT > 0
                         AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                         AND    X.SCD_STAT = 'S'
                       GROUP   BY X.RECP_TP ), 0) AS ARRE_MON
          FROM RTSD0100 A
             , RTSD0104 B
             , RTSD0106 C
             , RTSD0108 D
             , RTRE0010 E
             , RTRE0020 F
         WHERE 1=1
           AND B.ORD_NO  = v_Ord_No
           AND B.ORD_NO  = C.ORD_NO(+)
           AND B.ORD_NO  = D.ORD_NO
           AND A.CUST_NO = B.CUST_NO
           AND D.ACC_SEQ = E.ACC_SEQ(+)
           AND D.CRD_SEQ = F.CRD_SEQ(+)
    ) AA;    
    
  END sRtre0041ShopOverdueInfo;


  /*****************************************************************************
  --쇼핑몰 결제/신청 상세정보
  *****************************************************************************/
  PROCEDURE sRtre0041ShopApprovalInfo (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE         /* 계약번호              */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT
      AA.ORD_NO                                              /* 주문번호 */
      ,AA.PETTERN_CD                                         /* 패턴코드 */
      ,AA.SIZE_INFO                                          /* 사이즈정보 */
      ,AA.MAKER_NM                                           /* 제조사 */
      ,AA.MODEL_NM                                           /* 차량모델 */
      ,AA.CONTENTS_CD                                        /* 사양 */
      ,AA.CNT_NM                                             /* 본수 */
      ,AA.PERIOD_NM                                          /* 기간 */
      ,AA.CAR_NO                                             /* 차량번호 */
      ,AA.CHAN_NM                                            /* 온/오프라인 */
      ,AA.PROC_DAY                                           /* 장착일자 */
      ,SUBSTR(AA.OS_DAY,1,4)||'.'||SUBSTR(AA.OS_DAY,5,2)||'.'||SUBSTR(AA.OS_DAY,7,2) OS_DAY /* 소유권도래일 */
      ,CASE WHEN AA.BANK_NM IS NULL THEN AA.CARDCOM_NM  
       ELSE AA.BANK_NM
       END AS BANK_CARD_NM                                   /* 은행/카드사 */
      ,CASE WHEN AA.BANK_NM IS NULL THEN SUBSTR(AA.CARD_NO ,1,4)||LPAD('*',LENGTH(AA.CARD_NO)-8,'*')||SUBSTR(AA.CARD_NO,LENGTH(AA.CARD_NO)-20,4)
       ELSE SUBSTR(AA.ACCT_NO ,1,4)||LPAD('*',LENGTH(AA.ACCT_NO)-2,'*')||SUBSTR(AA.ACCT_NO,LENGTH(AA.ACCT_NO),1) 
       END AS BANK_CARD_NO                                   /* 계좌/카드번호 */
      ,CASE WHEN AA.BANK_NM IS NULL THEN AA.CARD_OWNER 
       ELSE AA.BANK_OWNER
       END AS BANK_CARD_OWNER                                /* 소유주 */
      ,AA.PAY_DD                                             /* 결제일 */
      ,AA.THIS_MON                                           /* 개월  */
      ,AA.MON_AMT                                            /* 월렌탈료 */
      ,AA.SALE_NM                                            /* 판매상품명 */
      ,AA.CLASS_CD                                           /* 차량분류 */                 
      ,AA.SEASON_NM                                          /* 계정멸 */
      ,AA.OE_YN                                              /* 순정, 호환 여부 */
    FROM (  
        SELECT B.ORD_NO
             ,(SELECT T.MAT_CD FROM RTSD0005 T WHERE T.MAT_CD = C.MAT_CD) AS MAT_CD
             ,(SELECT T.PETTERN_CD FROM RTSD0005 T WHERE T.MAT_CD = C.MAT_CD) AS PETTERN_CD
             ,(SELECT T.SECTION_WIDTH||'/'||T.ASPECT_RATIO||'R'||T.WHEEL_INCHES FROM RTSD0005 T WHERE T.MAT_CD = C.MAT_CD) AS SIZE_INFO
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S001', B.MAKER_CD) AS MAKER_NM
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', B.MODEL_CD) AS MODEL_NM
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', B.CONTENTS_CD) AS CONTENTS_CD
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', C.CNT_CD) AS CNT_NM
             ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', C.PERIOD_CD) AS PERIOD_NM
             ,B.CAR_NO
             ,DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM       /*온라인,오프라인    */
             ,SUBSTR(B.PROC_DAY,1,4)||'.'||SUBSTR(B.PROC_DAY,5,2)||'.'||SUBSTR(B.PROC_DAY,7,2) AS PROC_DAY /* 장착일자 */
             ,TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) - 1, 60), 'yyyymmdd') AS OS_DAY /* 소유권 도래일 */
             ,Pkg_Rtcm0051.f_sRtcm0051Codename('R001', E.BANK_CD)      BANK_NM       /*은행이름           */
             ,Pkg_Rtcm0051.f_sRtcm0051Codename('R002', F.CARDCOM_CD)   CARDCOM_NM    /*카드사이름         */
             ,E.ACCT_NO                                                ACCT_NO       /*계좌번호           */
             ,F.CARD_NO                                                CARD_NO       /*카드번호           */
             ,E.CUST_NM                                                BANK_OWNER    /*예금주             */
             ,F.CUST_NM                                                CARD_OWNER    /*카드소유주         */
             ,D.PAY_DD                                                               /* 결제일 */
             ,SUBSTR(D.ORD_DAY,1,4)||'.'||SUBSTR(D.ORD_DAY,5,2)||'.'||SUBSTR(D.ORD_DAY,7,2) AS ORD_DAY  /*계약일자          */
             ,NVL( (  SELECT  MAX(COUNT(*))
                        FROM    RTSD0109 X
                       WHERE   X.ORD_NO = B.ORD_NO
                         AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                         AND    X.SCD_STAT = 'S'
                       GROUP   BY X.RECP_TP ), 0) AS THIS_MON
             ,D.MON_AMT
             ,(SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM
             ,H.CLASS_CD
             ,Pkg_Rtcm0051.f_sRtcm0051Codename('S014', G.SEASON_CD)    AS SEASON_NM
             ,H.OE_YN
          FROM RTSD0100 A
             , RTSD0104 B
             , RTSD0106 C
             , RTSD0108 D
             , RTRE0010 E
             , RTRE0020 F
             , RTSD0005 G
             , RTSD0004 H
         WHERE 1=1
           AND B.ORD_NO         = v_Ord_No
           AND B.ORD_NO         = C.ORD_NO(+)
           AND B.ORD_NO         = D.ORD_NO
           AND A.CUST_NO        = B.CUST_NO
           AND D.ACC_SEQ        = E.ACC_SEQ(+)
           AND D.CRD_SEQ        = F.CRD_SEQ(+)
           AND C.MAT_CD         = G.MAT_CD
           AND B.MODEL_CD       = H.MODEL_CD
           AND B.CONTENTS_CD    = H.CONTENTS_CD
           AND G.SECTION_WIDTH  = H.SECTION_WIDTH
           AND G.ASPECT_RATIO   = H.ASPECT_RATIO
           AND G.WHEEL_INCHES   = H.WHEEL_INCHES 
           AND G.PLY_RATING     = H.PLY_RATING 
    ) AA;    
     
       
    
  END sRtre0041ShopApprovalInfo;

/*****************************************************************************
  -- 온라인 결제 내역 관리- PG사 수납등록처리: 쇼핑몰에서 결제한 선납할인에 대하여 수납처리하는 함수
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041PgPrptReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
--    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Dc_Cd          IN RTSD0025.DC_CD%TYPE,          /* 할인코드 */
    v_Prpt_Mon       IN RTSD0025.MAX_CNT%TYPE,        /* 선납개월 */        
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Chk_Cnt    NUMBER;
    v_Recv_Seq  RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호          */
    v_Recp_Tp   RTRE0041.RECP_TP%TYPE DEFAULT NULL;   /*청구구분              */
    v_Recp_Fg   RTRE0041.RECP_FG%TYPE DEFAULT NULL;   /*수납유형              */
    v_Cnc_Rseq  RTRE0041.CNC_RSEQ%TYPE DEFAULT NULL;  /*수납취소거래번호      */
    v_Cnc_Stat  RTRE0041.CNC_STAT%TYPE DEFAULT NULL;  /*수납취소여부          */

    v_Rear_Amt      NUMBER DEFAULT 0;                 /*미납수납금액          */
    v_Pnd_Amt       NUMBER DEFAULT 0;                 /*선수금수납금액        */
    v_Rc_Amt        NUMBER DEFAULT 0;                 /*수납처리금액          */
    v_Recp_Amt_M    NUMBER DEFAULT 0;                 /*수납금액(잔액)        */

    v_Tot_Ptpt_Amt       RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_MonTotPrptAmt      RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_RealMonPrptAmt     RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    vRealPrptAmt         RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    vTotDcAmt            RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    vArreAmt             RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    vTotRecpAmt          RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    vStartSeq            RTRE0160.PRPT_STTG_TMBT%TYPE DEFAULT NULL;
    vEndSeq              RTRE0160.PRPT_FNSH_TMBT%TYPE DEFAULT NULL;
    vDcRate              RTRE0160.PRPT_DSCN_RT%TYPE DEFAULT NULL;
    vDcAmt               RTRE0160.TOT_RNT_AMT%TYPE DEFAULT NULL;
    vRemainAmt           RTRE0160.TOT_RNT_AMT%TYPE DEFAULT NULL;
    v_Prpt_Seq           RTRE0161.PRPT_SEQ%TYPE DEFAULT NULL;
    
    v_Cust_No        RTRE0041.CUST_NO%TYPE;        /*고객번호*/
    
    v_Table_Count   NUMBER DEFAULT 0;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Loop_Count    NUMBER DEFAULT 0;

    e_Error EXCEPTION;

    Ref_Cursor SYS_REFCURSOR;
  BEGIN

    -- 필수값: 수납일자 , 계약번호 , 고객번호 ,수납금액 ,  수납방법 , 연체금액, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Recv_Day > TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
        v_Return_Message := '현재일 이후 수납일자('||v_Recv_Day||')에 대하여 처리가 불가능합니다.!';
        RAISE e_Error;
    END IF;

    IF '01' = Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) THEN

        IF SUBSTR(v_Recv_Day,1,6) != TO_CHAR(SYSDATE, 'YYYYMM') AND v_Reg_Id != 'rosso203' THEN
            v_Return_Message := '영업관리자는 수납일자('||v_Recv_Day||')에 대하여 당월까지만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Recv_Day != TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
            v_Return_Message := '수납일자('||v_Recv_Day||')는 당일이어야만 처리가 가능합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF TRIM(v_Cust_No) IS NULL THEN
--        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

    IF TRIM(v_Dc_Cd) IS NULL THEN
        v_Return_Message := '할인코드('||v_Dc_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Prpt_Mon) IS NULL THEN
        v_Return_Message := '선납개월('||v_Prpt_Mon||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    

    IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN

        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
            v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

--    IF TRIM(v_Recp_Id) IS NULL THEN
--        v_Return_Message := '수납자ID('||v_Recp_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

    IF (TRIM(v_Recp_Amt) IS NULL) OR (TRIM(v_Recp_Amt) < 0) THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recp_Pay) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R019', v_Recp_Pay)) THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN

        IF 0 != ISDATE(v_Bank_Recp_Day) THEN
            v_Return_Message := '은행입금일('||v_Bank_Recp_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        IF TRIM(v_Tno) IS NULL THEN
            v_Return_Message := 'PG거래번호('||v_Tno||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    ELSE
        -- C1:CMS이체 ,C2:카드이체
        v_Return_Message := '해당 수납방법('||v_Recp_Pay||')으로는 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--    IF TRIM(v_Arre_Amt) IS NULL THEN
--        v_Return_Message := '연체금액('||v_Arre_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 선납대상 정보를 조회한다
    SELECT  TOT_PRPT_AMT                                                                                                 /* 총선납대상금액 */
          , TOT_PRPT_AMT / TOT_SLS_CNT                                                               AS MON_TOT_PRPT_AMT  /* 총월렌탈료 */
          , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT, -1)                                AS REAL_MON_PRPT_AMT /* 할인 월렌탈료 */
          , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT                  AS REAL_PRPT_AMT     /* 선납금액 */
          , (TOT_PRPT_AMT - TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT) AS TOT_DC_AMT        /* 총 할인금액 */
          , ARRE_AMT                                                                                                     /* 미납금액 */
          , (TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT) + ARRE_AMT     AS TOT_RECP_AMT      /* 총 납부금액 */
          , START_SEQ                                                                                                    /* 시작회차 */
          , END_SEQ                                                                                                      /* 종료회차 */
          , DC_RATE                                                                                                      /* 할인률  */
          , DC_AMT                                                                                                       /* 할인금액 */
          , TOT_ARRE_AMT - ((TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT) + ARRE_AMT)   AS REMAIN_AMT         /* 남은금액 */
    INTO  v_Tot_Ptpt_Amt, v_MonTotPrptAmt, v_RealMonPrptAmt, vRealPrptAmt, vTotDcAmt, vArreAmt, vTotRecpAmt, vStartSeq, vEndSeq, vDcRate, vDcAmt, vRemainAmt
    FROM    (SELECT  TOT_PRPT_AMT
                   , START_SEQ
                   , END_SEQ
                   , DC_RATE
                   , DC_AMT
                   --, ARRE_AMT
                   , NVL(ARRE_AMT, 0) + NVL(REGI_AMT,0) AS ARRE_AMT
                   , (SELECT SUM(ARRE_AMT) FROM   RTSD0109 WHERE ORD_NO   = v_Ord_No AND ARRE_AMT > 0 AND SCD_STAT = 'S') AS TOT_ARRE_AMT
                   , (CASE WHEN DC_RATE IS NOT NULL THEN (TOT_PRPT_AMT * DC_RATE) * 0.01
                           WHEN DC_RATE IS NULL     THEN (TOT_PRPT_AMT - DC_AMT)
                      END
                     ) AS TOT_DC_PRPT_AMT
                   , TOT_SLS_CNT
             FROM    (SELECT  SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
                            , MIN(A.SCHD_SEQ) AS START_SEQ    /* 선납시작회차 */
                            , MAX(A.SCHD_SEQ) AS END_SEQ      /* 선납종료회차 */
                            , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
                            , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
                            , MAX((SELECT SUM(CNT)
                                   FROM   (
                                           SELECT CASE WHEN Z.SALE_AMT > 0 THEN 1
                                                  ELSE 0 END AS CNT
                                           FROM  RTSD0109 Z
                                           WHERE  Z.ORD_NO   = v_Ord_No
                                           AND    Z.RECP_TP = '11'
                                           AND    Z.RC_YN <> 'Y'
                                           AND    Z.SCD_STAT = 'S'
                                           AND    Z.USE_YN   = 'Y'
                                           AND    Z.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                           AND     ROWNUM    <= v_Prpt_Mon
                                         )))          AS TOT_SLS_CNT
                            , MAX((SELECT SUM(NVL(X.ARRE_AMT, 0))
                                   FROM   RTSD0109 X
                                   WHERE  X.ORD_NO   = v_Ord_No
                                   AND    X.ARRE_AMT > 0
                                   AND    X.RECP_TP = '01'
                                   AND    X.RC_YN <> 'Y'
                                   AND    X.SCD_STAT = 'S'
                                  ))          AS REGI_AMT   /* 등록금*/                               
                            , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
                                   FROM   RTSD0109 Y
                                   WHERE  Y.ORD_NO   = v_Ord_No
                                   AND    Y.ARRE_AMT > 0
                                   AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                   AND    Y.SCD_STAT = 'S'
                                   AND    Y.RECP_TP = '11'
                                  ))          AS ARRE_AMT     /* 연체금 */
                      FROM    RTSD0109 A
                      WHERE   A.ORD_NO   = v_Ord_No
                      AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                      AND     A.RC_YN    = 'N'
--                      AND     A.SALE_AMT > 0
--                      AND     A.ARRE_AMT > 0
                      AND     A.USE_YN   = 'Y'
                      AND     A.SCD_STAT = 'S'
                      AND     A.RECP_TP = '11'
                      AND     ROWNUM    <= v_Prpt_Mon
                     )
            );        
--    SELECT  TOT_PRPT_AMT                                                                                                 /* 총선납대상금액 */
--          , TOT_PRPT_AMT / v_Prpt_Mon                                                               AS MON_TOT_PRPT_AMT  /* 총월렌탈료 */
--          , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon, -1)                                AS REAL_MON_PRPT_AMT /* 할인 월렌탈료 */
--          , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon                  AS REAL_PRPT_AMT     /* 선납금액 */
--          , (TOT_PRPT_AMT - TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon) AS TOT_DC_AMT        /* 총 할인금액 */
--          , ARRE_AMT                                                                                                     /* 미납금액 */
--          , (TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon) + ARRE_AMT     AS TOT_RECP_AMT      /* 총 납부금액 */
--          , START_SEQ                                                                                                    /* 시작회차 */
--          , END_SEQ                                                                                                      /* 종료회차 */
--          , DC_RATE                                                                                                      /* 할인률  */
--          , DC_AMT                                                                                                       /* 할인금액 */
--          , TOT_ARRE_AMT - ((TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / 12 , -1) * 12) + ARRE_AMT)   AS REMAIN_AMT         /* 남은금액 */
--    INTO  v_Tot_Ptpt_Amt, v_MonTotPrptAmt, v_RealMonPrptAmt, vRealPrptAmt, vTotDcAmt, vArreAmt, vTotRecpAmt, vStartSeq, vEndSeq, vDcRate, vDcAmt, vRemainAmt
--    FROM    (SELECT  TOT_PRPT_AMT
--                   , START_SEQ
--                   , END_SEQ
--                   , DC_RATE
--                   , DC_AMT
--                   , ARRE_AMT
--                   , (SELECT SUM(ARRE_AMT) FROM   RTSD0109 WHERE ORD_NO   = v_Ord_No AND ARRE_AMT > 0 AND SCD_STAT = 'S') AS TOT_ARRE_AMT
--                   , (CASE WHEN DC_RATE IS NOT NULL THEN (TOT_PRPT_AMT * DC_RATE) * 0.01
--                           WHEN DC_RATE IS NULL     THEN (TOT_PRPT_AMT - DC_AMT)
--                      END
--                     ) AS TOT_DC_PRPT_AMT
--             FROM    (SELECT  SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
--                            , MIN(A.SCHD_SEQ) AS START_SEQ    /* 선납시작회차 */
--                            , MAX(A.SCHD_SEQ) AS END_SEQ      /* 선납종료회차 */
--                            , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
--                            , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
--                            , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
--                                   FROM   RTSD0109 Y
--                                   WHERE  Y.ORD_NO   = v_Ord_No
--                                   AND    Y.ARRE_AMT > 0
--                                   AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                                   AND    Y.SCD_STAT = 'S'
--                                  ))          AS ARRE_AMT     /* 연체금 */
--                      FROM    RTSD0109 A
--                      WHERE   A.ORD_NO   = v_Ord_No
--                      AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                      AND     A.RC_YN    = 'N'
--                      AND     A.SALE_AMT > 0
--                      AND     A.ARRE_AMT > 0
--                      AND     A.USE_YN   = 'Y'
--                      AND     A.SCD_STAT = 'S'
--                      AND     ROWNUM    <= v_Prpt_Mon
--                     )
--            );    
    
    --고객번호 획득
    v_Cust_No := Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No);    
    
    -- 선납요청 일련번호 채번
    v_Prpt_Seq := Pkg_Rtre0160.f_sRtre0160PrptSeq();

    -- 수납거래번호 채번
    v_Recv_Seq := f_sRtre0041RecvSeq();
    
    -- 선납내역 Insert
    Pkg_Rtre0160.p_InsertRtre0160PrePymntMst(v_Prpt_Seq, v_Ord_No, v_Cust_No, '51', v_Recp_Pay, v_Recv_Seq,
                                             v_Tno, v_Prpt_Mon, vDcRate, v_Tot_Ptpt_Amt, vTotDcAmt, vRealPrptAmt,
                                             vArreAmt, vStartSeq, vEndSeq, v_Recv_Day, v_Reg_Id,
                                             v_Success_Code,v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        v_Return_Message := '선납내역 Insert 실패!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;   

    -- 선납정보를 각 TABLE에 저장한다.
    FOR curs_RE0160 IN(
                        SELECT  A.ORD_NO
                              , A.SCHD_SEQ
                              , '51'                                        AS RECP_TP
                              , '선납'                                      AS RECP_TP_NM
                              , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                                ELSE B.TOT_DC_PRPT_AMT END                  AS SALE_AMT                                    
                              , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                                ELSE A.SALE_AMT - B.TOT_DC_PRPT_AMT END     AS DC_AMT                                  
                              , A.RECP_AMT
                              , CASE WHEN A.ARRE_AMT = 0 THEN A.ARRE_AMT
                                ELSE A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT) END     AS ARRE_AMT                                   
                              , Pkg_Rtsd0109.f_sRtsd0109SchdSeq(v_Ord_No) + ROWNUM -1 AS SCHD_SEQ1     /* 청구순번 */
                              , A.SCD_STAT                                  AS SCD_STAT   /* 스케쥴상태코드(Update) */
                              , 'I'                                         AS COMM_DVSN  /* 처리구분(I, U, D) */
                              , '11'                                        AS RECP_TP1    /* 청구구분 */
                              , A.RECP_NU                                               /* 청구회차 */
                              , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                                ELSE B.TOT_DC_PRPT_AMT END                  AS SALE_AMT1
                              , CASE WHEN A.SALE_AMT = 0 THEN 0
                                ELSE ROUND(B.TOT_DC_PRPT_AMT / 1.1, 0) END  AS SALE_NAMT1
                              , CASE WHEN A.SALE_AMT = 0 THEN 0
                                ELSE B.TOT_DC_PRPT_AMT - ROUND(B.TOT_DC_PRPT_AMT / 1.1, 0) END AS  SALE_VAMT1                                  
                              , 0                                         AS RECP_AMT1   /* 수납금액(VAT 포함) */
                              , CASE WHEN A.SALE_AMT = 0 THEN 0
                                ELSE A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT)  END AS  ARRE_AMT1                              
                              , A.DEMD_DT                                               /* 청구일자 */
                              , 'N'                                       AS ZLSPR      /* 청구보류 */
                              , ''                                        AS RC_DAY     /* 수납일자 */
                              , 'N'                                       AS RC_YN      /* 수납여부 */
                              , A.TAX_DT                                                /* 세금계산서발행일자(예정) */
                              , ''                                        AS TAX_NO     /* 세금계산서번호 */
                              , A.ZFB_DAY                                               /* 만기계산기준일 */
                              , A.CANCL_DAY                                             /* 중도완납일 */
                              , A.CUST_NO                                               /* 고객번호 */
                              , A.SALES_GROUP                                           /* 지사 */
                              , A.SALES_OFFICE                                          /* 지점 */
                              , A.AGENCY_CD                                             /* 장착대리점 */
                              , A.BEG_DAY                                               /* 시작일 */
                              , A.END_DAY                                               /* 종료일 */
                              , 'N'                                       AS DELAY_YN1  /* 연체이자적용여부 */
                              , 0                                         AS DELAY_RATE /* 연체이자율 */
                              , A.PAY_MTHD                                              /* 결제구분 */
                              , A.PAY_DD                                                /* 이체일 */
                              , 'Y'                                       AS USE_YN     /* 사용여부 */
                        FROM    RTSD0109 A
                              , (SELECT  ORD_NO
                                       , (CASE WHEN DC_RATE IS NOT NULL THEN TRUNC((TOT_PRPT_AMT - ((TOT_PRPT_AMT * DC_RATE) * 0.01)) / TOT_SLS_CNT, -1)
                                               WHEN DC_RATE IS NULL     THEN TRUNC((TOT_PRPT_AMT - (TOT_PRPT_AMT - DC_AMT)) / TOT_SLS_CNT, -1)
                                          END
                                         ) AS TOT_DC_PRPT_AMT
                                 FROM    (SELECT  /*+ INDEX(A RTSD0109_PK) */  
                                                  A.ORD_NO
                                                , SUM(NVL(A.ARRE_AMT, 0)) AS TOT_PRPT_AMT /* 총 선납금 */
                                                , MIN(A.SCHD_SEQ)         AS START_SEQ    /* 선납시작회차 */
                                                , MAX(A.SCHD_SEQ)         AS END_SEQ      /* 선납종료회차 */
                                                , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
                                                , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
                                                , MAX((SELECT SUM(CNT)
                                                       FROM   (
                                                               SELECT /*+ INDEX(Z RTSD0109_PK) */  
                                                                      CASE WHEN Z.SALE_AMT > 0 THEN 1
                                                                      ELSE 0 END AS CNT
                                                               FROM  RTSD0109 Z
                                                               WHERE  Z.ORD_NO   = v_Ord_No
                                                               AND    Z.RECP_TP = '11'
                                                               AND    Z.RC_YN <> 'Y'
                                                               AND    Z.SCD_STAT = 'S'
                                                               AND    Z.USE_YN   = 'Y'
                                                               AND    Z.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                                               AND     ROWNUM    <= v_Prpt_Mon
                                                             )))          AS TOT_SLS_CNT
                                                , MAX((SELECT /*+ INDEX(Y RTSD0109_PK) */  
                                                              SUM(NVL(Y.ARRE_AMT, 0))
                                                       FROM   RTSD0109 Y
                                                       WHERE  Y.ORD_NO   = v_Ord_No
                                                       AND    Y.ARRE_AMT > 0
                                                       AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                                       AND    Y.SCD_STAT = 'S'
                                                       AND    Y.RECP_TP = '11'
                                                      ))                  AS ARRE_AMT     /* 연체금 */
                                          FROM    RTSD0109 A
                                          WHERE   A.ORD_NO   = v_Ord_No
                                          AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                          AND     A.RC_YN    = 'N'
            --                              AND     A.SALE_AMT > 0
            --                              AND     A.ARRE_AMT > 0
                                          AND     A.USE_YN   = 'Y'
                                          AND     A.SCD_STAT = 'S'
                                          AND     A.RECP_TP = '11'
                                          AND     ROWNUM    <= v_Prpt_Mon
                                          GROUP BY A.ORD_NO
                                         )
                                )        B
                        WHERE   A.ORD_NO   = v_Ord_No
                        AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                        AND     A.RC_YN    = 'N'
            --            AND     A.SALE_AMT > 0
            --            AND     A.ARRE_AMT > 0
                        AND     A.USE_YN   = 'Y'
                        AND     A.SCD_STAT = 'S'
                        AND     A.RECP_TP = '11'
                        AND     A.ORD_NO   = B.ORD_NO
                        AND     ROWNUM    <= v_Prpt_Mon  
                      )
    LOOP
        -- 선납상세정보 insert
        Pkg_Rtre0160.p_InsertRtre0161PrePymntDtl(v_Prpt_Seq, curs_RE0160.ORD_NO, curs_RE0160.SCHD_SEQ1, 
                                                 curs_RE0160.SALE_AMT, curs_RE0160.DC_AMT, v_Reg_Id,
                                                 v_Success_Code,v_Return_Message, v_ErrorText);
 
        IF 0 != v_Success_Code THEN
            v_Return_Message := '선납상세정보 Insert 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;     
        
        -- 청구스케쥴 Update /*임시로 주석 처리 유라클*/
        Pkg_Rtsd0109.p_UpdateRtsd0109SalesPrpt (curs_RE0160.ORD_NO, curs_RE0160.SCHD_SEQ, 'C', v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);        
                    
        IF 0 != v_Success_Code THEN
            v_Return_Message := '청구스케쥴 Update 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;     
        
        -- 청구스케쥴 Insert
        Pkg_Rtsd0109.p_IUDRtsd0109 (curs_RE0160.COMM_DVSN, curs_RE0160.ORD_NO, curs_RE0160.SCHD_SEQ1, curs_RE0160.RECP_TP1, curs_RE0160.RECP_NU,
                                       curs_RE0160.SCD_STAT, curs_RE0160.SALE_AMT1, curs_RE0160.SALE_NAMT1, curs_RE0160.SALE_VAMT1,
                                       0, curs_RE0160.ARRE_AMT1, curs_RE0160.DEMD_DT, curs_RE0160.ZLSPR, curs_RE0160.RC_DAY,
                                       curs_RE0160.RC_YN, curs_RE0160.TAX_DT, curs_RE0160.TAX_NO, curs_RE0160.ZFB_DAY,
                                       curs_RE0160.CANCL_DAY, curs_RE0160.CUST_NO, curs_RE0160.SALES_GROUP, curs_RE0160.SALES_OFFICE, 
                                       curs_RE0160.AGENCY_CD, curs_RE0160.BEG_DAY, curs_RE0160.END_DAY, curs_RE0160.DELAY_YN1,
                                       curs_RE0160.DELAY_RATE, curs_RE0160.PAY_MTHD, curs_RE0160.PAY_DD, curs_RE0160.USE_YN,
                                       v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '청구스케쥴 Insert 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;   
        
    END LOOP;

    -- 수납대상리스트 임시테이블 존재여부 확인
    SELECT COUNT(*)
    INTO   v_Table_Count
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    -- 수납대상리스트 임시테이블이 없으면
    IF (SQL%NOTFOUND) OR (v_Table_Count = 0) THEN

        -- 수납대상리스트 임시테이블 생성
        EXECUTE IMMEDIATE
        'CREATE GLOBAL TEMPORARY TABLE RTTEMP01 (
              ORD_NO        VARCHAR2(15 BYTE),
              SCHD_SEQ      NUMBER(3),
              RECP_TP       VARCHAR2(2 Byte),
              CUST_NO       VARCHAR2(10 BYTE),
              DEMD_DT       VARCHAR2(8 BYTE),
              ZFB_DAY       VARCHAR2(8 BYTE),
              SCD_STAT      VARCHAR2(1 BYTE),
              ZLSPR         VARCHAR2(1 BYTE),
              RC_YN         VARCHAR2(1 BYTE),
              USE_YN        CHAR(1 BYTE),
              SALE_AMT      NUMBER(10),
              RECP_AMT      NUMBER(10),
              ARRE_AMT      NUMBER(10),
              RECP_NU       NUMBER(3),
              RECA_AMT      NUMBER(10)
         ) ON COMMIT DELETE ROWS;
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''PG사 수납등록처리(Pkg_Rtre0041)시 사용 TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''계약번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_TP IS ''청구구분'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''고객번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.DEMD_DT IS ''청구일자'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ZFB_DAY IS ''만기계산기준일'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCD_STAT IS ''스케줄상태코드'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ZLSPR IS ''청구보류'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RC_YN IS ''수납여부'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.USE_YN IS ''사용여부'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SALE_AMT IS ''매출금액'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납금액'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''연체금액 '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_NU IS ''청구회차'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECA_AMT IS ''수납처리금액'';';

    END IF;


    -- 수납대상리스트 임시테이블에 생성
    INSERT INTO RTTEMP01
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*청구순번            */
            A.RECP_TP,                   /*청구구분            */
            A.CUST_NO,                   /*고객번호            */
            A.DEMD_DT,                   /*청구일자            */
            A.ZFB_DAY,                   /*만기계산기준일      */
            A.SCD_STAT,                  /*스케줄상태코드      */
            A.ZLSPR,                     /*청구보류            */
            A.RC_YN,                     /*수납여부            */
            A.USE_YN,                    /*사용여부            */
            A.SALE_AMT,                  /*매출금액(VAT 포함)  */
            A.RECP_AMT,                  /*수납금액(VAT포함)   */
            A.ARRE_AMT,                  /*연체금액(VAT포함)   */
            A.RECP_NU,                   /*청구회차            */
            0 RECA_AMT                   /*수납처리금액        */
    FROM    RTSD0109 A                   /*청구스케쥴          */
    WHERE   A.ORD_NO   = v_Ord_No        /*계약번호            */
    AND     A.CUST_NO  = v_Cust_No       /*고객번호            */
    AND     A.SCD_STAT = 'S'             /*스케줄상태코드      */
    AND     A.ZLSPR    = 'N'             /*청구보류            */
    AND     A.RC_YN    <> 'Y'            /*수납여부            */
    AND     A.USE_YN   = 'Y'             /*사용여부            */
    AND     A.ZFB_DAY  <= v_Recv_Day;    /*만기계산기준일:수납일이전까지 미납된  */

    -- 수납대상리스트가 없으면
    IF SQL%NOTFOUND THEN

        -- 수납금액을 모두 선수금으로 처리함
        v_Pnd_Amt := v_Recp_Amt;


        -- 수납대상리스트에  선수금 데이터 추가(수납금액을 수납처리금액 값에 설정하고 나머지는 NULL 처리함)
        INSERT INTO RTTEMP01
        SELECT v_Ord_No ORD_NO, NULL SCHD_SEQ, NULL RECP_TP, v_Cust_No CUST_NO, NULL DEMD_DT, NULL ZFB_DAY, NULL SCD_STAT,
               NULL ZLSPR, NULL RC_YN, NULL USE_YN, NULL SALE_AMT, NULL RECP_AMT, NULL ARRE_AMT, NULL RECP_NU, v_Pnd_Amt RECA_AMT
        FROM   DUAL;

        IF SQL%NOTFOUND THEN
            v_Return_Message := '수납대상리스트에 선수금 데이터 추가 실패!!';
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
        END IF;


    -- 수납대상리스트가 있으면
    ELSE
        -- 미납대상건수 = 수납대상리스트 생성건수
        v_Row_Count := SQL%ROWCOUNT;

        -- 수납금액(잔액) = 수납금액
        v_Recp_Amt_M := v_Recp_Amt;

        FOR CUR IN (SELECT  *
                    FROM    RTTEMP01 A
                    ORDER   BY A.ZFB_DAY, A.RECP_TP) LOOP

            v_Loop_Count := v_Loop_Count+1;

            -- 수납금액(잔액)  연체금액(미납금액)
            IF v_Recp_Amt_M >= NVL(CUR.ARRE_AMT,0) THEN

                v_Recp_Amt_M := v_Recp_Amt_M - NVL(CUR.ARRE_AMT,0);
                v_Rc_Amt := NVL(CUR.ARRE_AMT,0); /*수납처리금액        */
                --v_Pnd_Amt := NVL(CUR.ARRE_AMT,0); /*선수금수납금액        */

            ELSIF v_Recp_Amt_M < NVL(CUR.ARRE_AMT,0) THEN

                v_Recp_Amt_M := 0;
                v_Rc_Amt := v_Recp_Amt_M; /*수납처리금액        */
                --v_Pnd_Amt := v_Recp_Amt_M; /*선수금수납금액        */

            END IF;

            -- 미납수납금액 =  수납처리금액의 합계
            --v_Rear_Amt := v_Rear_Amt + NVL(v_Pnd_Amt,0);
            v_Rear_Amt := v_Rear_Amt + NVL(v_Rc_Amt,0);

            -- 수납대상리스트에 수납처리금액 업데이트
            UPDATE RTTEMP01
            SET    RECA_AMT = v_Rc_Amt
            WHERE  ORD_NO   = CUR.ORD_NO
            AND    SCHD_SEQ = CUR.SCHD_SEQ;

            IF SQL%NOTFOUND THEN
                v_Return_Message := '미납리스트에 수납처리금액 업데이트 실패!!';
                v_ErrorText := SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END IF;

            -- 수납금액(잔액) 모두 소진되었으면 빠져나감
            IF v_Recp_Amt_M = 0 THEN
                EXIT;
            END IF;

            -- 마지막 데이터 이면
            IF v_Row_Count = v_Loop_Count THEN

                -- 수납대상리스트의 미납금액을 수납금액에서 차감해도 남는 금액은 선수금으로 처리
                IF 0 < v_Recp_Amt_M THEN

                    -- 선수금수납금액 :  남은 금액을  모두 선수금으로 처리함
                    v_Pnd_Amt := v_Recp_Amt_M;

                    -- 수납대상리스트에  선수금 데이터 추가(수납금액을 수납처리금액 값에 설정하고 나머지는 NULL 처리함)
                    INSERT INTO RTTEMP01
                    SELECT v_Ord_No ORD_NO, NULL SCHD_SEQ, NULL RECP_TP, v_Cust_No CUST_NO, NULL DEMD_DT, NULL ZFB_DAY, NULL SCD_STAT,
                           NULL ZLSPR, NULL RC_YN, NULL USE_YN, NULL SALE_AMT, NULL RECP_AMT, NULL ARRE_AMT, NULL RECP_NU, v_Pnd_Amt RECA_AMT
                    FROM   DUAL;

                    IF SQL%NOTFOUND THEN
                        v_Return_Message := '미납리스트에 선수금 데이터 추가 실패!!';
                        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
                        RAISE e_Error;
                    END IF;

                END IF;
            END IF;

        END LOOP;

    END IF;


    -- 3. 수납내역 생성처리

    -- 수납대상리스트 조회(미납리스트와 선수금 내역)
    OPEN  Ref_Cursor FOR
    SELECT  A.ORD_NO,               /*계약번호 */
            A.CUST_NO,              /*고객번호 */
            A.SCHD_SEQ,             /*청구순번 */
            A.ARRE_AMT,             /*미납금액 */
            A.RECA_AMT RECP_AMT     /*수납금액 */
    FROM    RTTEMP01 A
    WHERE   A.RECA_AMT > 0          /*수납금액이 존재하는 것만 */
    ORDER   BY A.ZFB_DAY, A.RECP_TP, NVL(A.SCHD_SEQ,999); -- 선수금을 무조건 마지막에 위치함.

    v_Recp_Fg   := '01';   /*수납유형:입금(01)     */

    Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Recv_Day, v_Ord_No, v_Cust_No,
                                   v_Recp_Id, v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Recv_Seq,
                                   v_Rear_Amt, v_Pnd_Amt, v_Reg_Id, v_Success_Code,
                                   v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '수납내역 생성처리 실패!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    -- 4. 수납처리 생성완료 후 수납방법에 따라 RTRE0040, RTRE0041에 INSERT 한다.
    -- 카드즉시출금내역 존재 여부
    SELECT NVL(COUNT(1), 0)
    INTO   v_Chk_Cnt
    FROM   RTRE0160
    WHERE  RECP_TRNO       = v_Tno
    AND    PRPT_CNC_STAT <> 'Y';
    

    -- 초기값 설정
    IF v_Chk_Cnt = 0 THEN
        v_Recp_Tp   := '90';   /*청구구분:선수금(90)   */
    ELSE
        v_Recp_Tp   := '51';   /*청구구분:선납할인(51)   */    
    END IF;   

    v_Cnc_Rseq  := NULL;   /*수납취소거래번호      */
    v_Cnc_Stat  := 'N';    /*수납취소여부          */

    -- A1:무통장 ,C1:CMS이체 ,C2:카드이체 ,P1:카드(PG) ,P2:계좌이체(PG), P3:휴대폰(PG)
    IF TRIM(v_Recp_Pay) = 'A1' THEN


        IF 0 != Pkg_Rtre0040.f_sRtre0040Count(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != Pkg_Rtre0040.f_InsertRtre0040(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Bank_Recp_Day,
                                              v_Cnc_Rseq, v_Cnc_Stat, v_Recp_Id, v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '무통장 수납내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    ELSIF TRIM(v_Recp_Pay) IN ('P1','P2','P3') THEN

        IF 0 != Pkg_Rtre0041.f_sRtre0041Count(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF 0 != Pkg_Rtre0041.f_InsertRtre0041(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Amt, v_Recp_Tp, v_Recp_Pay, v_Recp_Fg,
                                              v_Tno, v_Cnc_Rseq, v_Cnc_Stat, v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '온라인 결제 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041PgReceipt(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0041.p_InsertRtre0041PgReceipt(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0041PgPrptReceipt;

END Pkg_Rtre0041;