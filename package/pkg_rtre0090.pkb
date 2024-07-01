CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0090 AS
/*******************************************************************************
   NAME      Pkg_Rtre0090
   PURPOSE   현금영수증 발급기준 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
   1.1        2017-04-06  wjim             [20170406_01] 0원 영수증 발급불가
   1.2        2017-11-03  wjim             [20171103_02] KCP 대량요청 업로드 파일 변경
                                           - '현금영수증 거래번호' 추가 (10/26)
   1.3        2019-05-31  wjim             [20190429_01] 채권매각계약 집계 제외                                           
*******************************************************************************/

  /*****************************************************************************
  -- 현금영수증 발급기준 Count
  *****************************************************************************/
  FUNCTION f_sRtre0090Count(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,          /*고객번호            */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE            /*등록순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0090
    WHERE   CUST_NO = v_Cust_No
    AND     CC_SEQ  = v_Cc_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0090Count;

  /*****************************************************************************
  -- 현금영수증 발급기준 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0090 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.CC_SEQ,                    /*등록순번            */
            A.STR_DAY,                   /*적용시작일          */
            A.END_DAY,                   /*적용종료일          */
            A.CHI_TP,                    /*현금영수증 발급기준 */
            A.CHI_NO,                    /*현금영수증 발급번호 */
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0090 A
    WHERE   A.CUST_NO = DECODE(v_Cust_No , NULL, A.CUST_NO , v_Cust_No)
    AND     A.CC_SEQ  = DECODE(v_Cc_Seq  , NULL, A.CC_SEQ  , v_Cc_Seq)
    AND     A.STR_DAY = DECODE(v_Str_Day , NULL, A.STR_DAY , v_Str_Day)
    AND     A.END_DAY = DECODE(v_End_Day , NULL, A.END_DAY , v_End_Day)
    AND     A.CHI_TP  = DECODE(v_Chi_Tp  , NULL, A.CHI_TP  , v_Chi_Tp)
    AND     A.CHI_NO  = DECODE(v_Chi_No  , NULL, A.CHI_NO  , v_Chi_No)
    AND     A.DEL_YN  = DECODE(v_Del_Yn  , NULL, A.DEL_YN  , v_Del_Yn)
    AND     A.REG_ID  = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id);

  END p_sRtre0090;

  /*****************************************************************************
  -- 현금영수증 발급기준 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0090 (
            CUST_NO,
            CC_SEQ,
            STR_DAY,
            END_DAY,
            CHI_TP,
            CHI_NO,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,
            v_Cc_Seq,
            v_Str_Day,
            v_End_Day,
            v_Chi_Tp,
            v_Chi_No,
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

  END f_InsertRtre0090;

  /*****************************************************************************
  -- 현금영수증 발급기준 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0090
    SET    STR_DAY = v_Str_Day,
           END_DAY = v_End_Day,
           CHI_TP  = v_Chi_Tp,
           CHI_NO  = v_Chi_No,
           DEL_YN  = v_Del_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  CUST_NO = v_Cust_No
    AND    CC_SEQ  = v_Cc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0090;

  /*****************************************************************************
  -- 현금영수증 발급기준 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0090
    SET    DEL_YN  = 'Y',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  CUST_NO = v_Cust_No
    AND    CC_SEQ  = v_Cc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0090;

  /*****************************************************************************
  -- 현금영수증 발급기준 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0090 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN OUT RTRE0090.CC_SEQ%TYPE,     /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:고객번호,적용시작일,적용종료일,현금영수증 발급기준,현금영수증 발급번호, 삭제여부, 등록자 ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Str_Day) THEN
        v_Return_Message := '적용시작일('||v_Str_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_End_Day) THEN
        v_Return_Message := '적용종료일('||v_End_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chi_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('A029', v_Chi_Tp)) THEN
        v_Return_Message := '현금영수증 발급기준('||v_Chi_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Chi_No) IS NULL THEN
        v_Return_Message := '현금영수증 발급번호('||v_Chi_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Del_Yn) IS NULL) OR (TRIM(v_Del_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '삭제여부('||v_Del_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0090Count(v_Cust_No, v_Cc_Seq) THEN
            v_Return_Message := '해당 고객번호('||v_Cust_No||'-'||v_Cc_Seq||')로 이미 등록된 데이터가 존재함으로 신규등록처리가 불가합니다.!!';
            RAISE e_Error;
        END IF;

        v_Cc_Seq := f_sRtre0090CcSeq(v_Cust_No);

        IF 0 != f_InsertRtre0090(v_Cust_No, v_Cc_Seq, v_Str_Day, v_End_Day,
                                     v_Chi_Tp, v_Chi_No, v_Del_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
            v_Return_Message := '현금영수증 발급기준 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 = f_sRtre0090Count(v_Cust_No, v_Cc_Seq) THEN
                v_Return_Message := '해당 고객번호('||v_Cust_No||'-'||v_Cc_Seq||')로 등록된 데이터가 존재하지 않음으로 수정/삭제처리가 불가합니다.!!';
                RAISE e_Error;
            END IF;


            IF 0 != f_UpdateRtre0090(v_Cust_No, v_Cc_Seq, v_Str_Day, v_End_Day,
                                     v_Chi_Tp, v_Chi_No, v_Del_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '현금영수증 발급기준 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0090(v_Cust_No, v_Cc_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '현금영수증 발급기준 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_IUDRtre0090(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_IUDRtre0090(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0090;

  /*****************************************************************************
  -- 현금영수증 발급기준 - 등록순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0090CcSeq(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER IS
    v_Cc_Seq    RTRE0090.CC_SEQ%TYPE DEFAULT NULL;      /*등록순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(CC_SEQ)
                 FROM    RTRE0090
                 WHERE   CUST_NO = v_Cust_No)+ 1, 1)
    INTO    v_Cc_Seq
    FROM    DUAL;

    RETURN v_Cc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0090CcSeq;


  /*****************************************************************************
  -- 현금영수증 발급기준 - RE-030101_현금영수증 대상집계
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-06  wjim             [20170406_01] 0원 영수증 발급불가
                                           - 고개사망 등 예외적으로 0원 중도수납 처리 등 0원 수납 발생 (데이터 수기작업)
                                           - 0원 현금영수증 발행이 불가하므로 0원 수납의 경우 발행(집계)대상에서 제외
   1.3        2019-05-31  wjim             [20190429_01] 채권매각계약 집계 제외                                           
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090Aggregate (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_Recv_SDay      IN RTRE0030.RECV_DAY%TYPE,       /*수납일자START         */
    v_Recv_EDay      IN RTRE0030.RECV_DAY%TYPE,       /*수납일자END           */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    /*
    수납일자 시작일과 수납일자 종료일 사이에 현금영수증 발급이 가능한 수납방법으로 수납처리된 내역에 대하여 집계한다.
     1) 수납기간 : RECV_DAY BETWEEN RECV_DAY_F AND RECV_DAY_T
     2) 현금영수증 발급이 가능한 수납방법 : 공통코드 R032
        RECP_PAY IN ( SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R032' AND USE_YN = 'Y' )
     3) 현금영수증 기발행건 제외
        CASH_YN = 'N'
     4) 수납취소건 제외
        CNC_STAT = 'N'
     5) 수납유형이 '수납처리'/'수납취소'인 경우만 해당
        RECP_FG = '01'
     6) 세금계산서건 제외-고객이 개인인 경우 해당
        RTSD0100.CUST_TP = '01'
    */

    -- 현금영수증 발행 대상 조회
    CURSOR  Cur_Rtre0090 IS
    SELECT  A.RECV_SEQ         AS RECV_SEQ,
            MAX ( A.RECV_DAY ) AS RECV_DAY,
            MAX ( TO_CHAR(A.REG_DT, 'HH24MISS' ) ) AS RECV_TIME,
            MAX ( A.CUST_NO )  AS CUST_NO,
            MAX ( B.CUST_NM )  AS CUST_NM,
            DECODE( A.RECP_FG, '01', '7100', '7102' )   AS CASHD_TP,
            '0'                AS CASHD_FG,
            MAX( DECODE( NVL(C.CHI_NO, 'N') , 'N', B.MOB_NO, C.CHI_NO)) AS CHI_NO,
            --MAX( DECODE( NVL(C.CHI_NO, 'N') , 'N', B.TEL_NO, C.CHI_NO)) AS CHI_NO,
            SUM( A.RECP_AMT )  AS RECP_AMT,
            ROUND( SUM( A.RECP_AMT) / 1.1 ) AS RECP_NAMT,
            SUM( A.RECP_AMT ) - ROUND( SUM( A.RECP_AMT ) / 1.1 ) AS RECP_VAMT
    FROM    RTRE0030 A,
            RTSD0100 B,
            RTRE0090 C
    WHERE   A.RECV_DAY BETWEEN v_Recv_SDay AND v_Recv_EDay
--    AND     A.RECP_TP <> '41'                   -- 현금영수증 발행대상 제외 정창인과장요청 2015-11-04 -> 12-03 원복
    AND     A.RECP_PAY IN ( SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R032' AND USE_YN = 'Y' )
    AND     A.CASH_YN  = 'N'
    AND     A.CNC_STAT = 'N'
    AND     A.RECP_FG  IN ( '01', '11' )
    AND     A.RECP_AMT <> 0 --[20170406_01] 
    AND     B.CUST_NO  = A.CUST_NO
    AND     B.CUST_TP  = '01'
    AND     C.CUST_NO(+) = A.CUST_NO
    AND     C.STR_DAY(+) <= v_Cash_Day
    AND     C.END_DAY(+) >= v_Cash_Day
    AND     C.DEL_YN(+)  = 'N'
    AND     NOT EXISTS (SELECT 1 FROM RTTEMPIWJ_190429_01 WHERE COL_01 = A.ORD_NO) --[20190429_01]
    GROUP   BY A.RECV_SEQ, DECODE( A.RECP_FG, '01', '7100', '7102' );

    v_Cash_Seq  RTRE0091.CASH_SEQ%TYPE DEFAULT NULL; /*현금영수증 발행 일련번*/
    v_Cash_Stat RTRE0091.CASH_STAT%TYPE DEFAULT NULL;/*현금영수증 발행상태   */

    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*송수신파일구분      */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;/*요청일자            */
    v_File_Nm   RTRE0099.FILE_NM%TYPE DEFAULT NULL; /*파일명              */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;/*파일순번            */

    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT NULL;  /*계좌신청건수          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT NULL;/*계좌해지건수          */

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:현금영수증발행일자,수납일자START,수납일자END,  등록자 ID
    IF 0 != ISDATE(v_Cash_Day) THEN
        v_Return_Message := '현금영수증발행일자('||v_Cash_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Recv_SDay) THEN
        v_Return_Message := '수납일자START('||v_Recv_SDay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Recv_EDay) THEN
        v_Return_Message := '수납일자END('||v_Recv_EDay||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 초기값 설정
    v_File_Tp  := 'CH01_INX';
    v_File_Nm  := 'KCP_BATCH_FILE_CH01_INX_V3770_'||v_Cash_Day;
    v_Rqst_Day := v_Cash_Day;


    -- 1. 기준일자 기준으로 대상집계 내역이 존재하는지 확인하고 존재하면 오류로 종료처리하고 오류메시지 제공
    IF 0 != Pkg_Rtre0099.f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') THEN
        v_Return_Message := '해당 기준일자로 대상집계 파일('||v_File_Nm||')이 이미 존재하므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 송수신파일구분/요청일자/파일명 기준  파일순번 획득
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 2. 기준일자 기준으로 대상집계 내역 존재하지 않는 경우 송수신 작업( RTRE0099)에 데이터 생성
    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
                v_File_Tp   ,        /*(File_Tp  )송수신파일구분    */
                v_Rqst_Day  ,        /*(Rqst_Day )요청일자          */
                v_File_Nm   ,        /*(File_Nm  )파일명            */
                v_File_Seq  ,        /*(File_Seq )파일순번          */
                NULL,                /*(File_Data)파일데이터        */
                'N',                 /*(Extrc_Yn )대상집계여부      */
                'N',                 /*(Confi_Yn )대상확인여부      */
                'N',                 /*(Fcret_Yn )파일생성여부      */
                'N',                 /*(Ftran_Yn )파일전송여부      */
                NULL,                /*(Stdex_Dd )결제일이체기준    */
                v_Recv_SDay,        /*(Str_Day  )집계대상 시작일   */
                v_Recv_EDay,        /*(End_Day  )집계대상 종료일   */
                'N',                 /*(Header_Yn)HEADER 존재여부   */
                'N',                 /*(Trailer_Y)TRAILER 존재여부  */
                0,                   /*(Tdata_Cnt)데이터 총건수     */
                0,                   /*(Tdata_Amt)데이터 총금액     */
                0,                   /*(Acrq_Cnt )계좌신청건수      */
                0,                   /*(Accnrq_Cn)계좌해지건수      */
                0,                   /*(Rmcnrq_Cn)계좌임의해지건수  */
                0,                   /*(Reqst_Cnt)요청건수          */
                0,                   /*(Reqst_Amt)요청금액          */
                0,                   /*(Cncrq_Cnt)취소요청건수      */
                0,                   /*(Cncrq_Amt)취소요청금액      */
                0,                   /*(Srecp_Cnt)정상결제 처리건수 */
                0,                   /*(Srecp_Amt)정상결제 처리금액 */
                0,                   /*(Hsrcp_Cnt)부분결제 처리건수 */
                0,                   /*(Hsrcp_Amt)부분결제 처리금액 */
                0,                   /*(Erecp_Cnt)결제실패 처리건수 */
                0,                   /*(Erecp_Amt)결제실패 처리금액 */
                0,                   /*(Scnrq_Cnt)취소정상 처리건수 */
                0,                   /*(Scnrq_Amt)취소정상 처리금액 */
                0,                   /*(Ecnrq_Cnt)취소오류 처리건수 */
                0,                   /*(Ecnrq_Amt)취소오류 처리금액 */
                'N',                 /*(Del_Yn   )삭제여부          */
                v_Reg_Id,            /*(Reg_Id   )등록자 ID         */
                v_ErrorText
                ) THEN

        v_Return_Message := ' 송수신 작업(RTRE0099) Insert 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 데이터 초기화
    v_Acrq_Cnt   := 0;   -- 계좌신청건수
    v_Accnrq_Cnt := 0;   -- 계좌해지건수
    v_Cash_Stat  := '1'; -- 현금영수증 발행상태('R033') : 대상집계(1), 전송(2), 발행오류(3), 발행완료(5)

    -- 현금영수증 발행 대상 신청건 처리
    FOR CUR IN Cur_Rtre0090 LOOP
        EXIT WHEN Cur_Rtre0090%NOTFOUND;
        v_Acrq_Cnt := v_Acrq_Cnt+1;

        -- 위의 쿼리에서 나온 결과 데이터를 이용하여 수납 내역(RTRE0091)에 INSERT 한다.
        Pkg_Rtre0091.p_IUDRtre0091 (
                    'I'           ,    /*(v_Comm_Dvsn )처리구분(I,U,D)       */
                    CUR.RECV_SEQ  ,    /*(v_Recv_Seq  )수납거래번호          */
                    v_Cash_Seq    ,    /*(v_Cash_Seq  )현금영수증 발행 일련번*/
                    v_Cash_Day    ,    /*(v_Cash_Day  )현금영수증발행일자    */
                    v_File_Seq    ,    /*(v_File_Seq  )파일순번              */
                    CUR.RECV_DAY  ,    /*(v_Recv_Day  )수납일자              */
                    CUR.RECV_TIME ,    /*(v_Recv_Time )수납시간              */
                    CUR.CUST_NO   ,    /*(v_Cust_No   )고객번호              */
                    CUR.CUST_NM   ,    /*(v_Cust_Nm   )고객명                */
                    CUR.CASHD_TP  ,    /*(v_Cashd_Tp  )거래구분              */
                    CUR.CASHD_FG  ,    /*(v_Cashd_Fg  )발행대상구분          */
                    CUR.CHI_NO    ,    /*(v_Chi_No    )현금영수증 식별번호   */
                    CUR.RECP_AMT  ,    /*(v_Cash_Amt  )현금영수증 발행금액   */
                    CUR.RECP_NAMT ,    /*(v_Cash_Namt )현금영수증 발행 공급가*/
                    CUR.RECP_VAMT ,    /*(v_Cash_Vamt )현금영수증 발행 부가세*/
                    v_Cash_Stat   ,    /*(v_Cash_Stat )현금영수증 발행상태   */
                    NULL          ,    /*(v_Cashapp_No)현금영수증 승인번호   */
                    NULL          ,    /*(v_Csercd    )발급오류코드          */
                    NULL          ,    /*(v_Csermsg   )발급오류메세지        */
                    NULL          ,    /*(v_Ocapp_No  )원승인번호            */
                    NULL          ,    /*(v_Ocash_Day )원승인일자            */
                    'N'           ,    /*(v_Cnc_Yn    )취소여부              */
                    v_Reg_Id      ,    /*(v_Reg_Id    )등록자 ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납 내역(RTRE0091) 등록중 에러 발생!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 대상집계된 수납내역의 현금영수증 발행여부(CASH_YN) 에 'P' (발행처리중) 값으로 업데이트 한다.
        IF 0 != Pkg_Rtre0030.f_UpdateRtre0030Aggregate (CUR.RECV_SEQ, 'P', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' 대상집계된 수납내역의 현금영수증 발행여부에 P(발행처리중) 값으로 업데이트 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0090%ISOPEN THEN
        CLOSE Cur_Rtre0090;
    END IF;

    -- 송수신 작업 Update - 계좌신정 대상 배치 결과 업데이트
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (v_File_Tp, v_Cash_Day, v_File_Nm, v_File_Seq,
                                                     'Y',  v_Acrq_Cnt, v_Accnrq_Cnt, 0, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) Update - 계좌신정 대상 배치 결과 업데이트 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0090Aggregate;


  /*****************************************************************************
  -- 현금영수증 발급기준 - RE-030102_현금영수증 파일생성 : 카드이체 내역을 기준으로 송신 대상 파일 형태로 내역을 생성하고 파일생성자료를 RETURN 하는 함수
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-11-03  wjim             [20171103_02] KCP 대량요청 업로드 파일 변경
                                           - '현금영수증 거래번호' 추가 (10/26)
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090FileCreate (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 송수신처리 내역
    CURSOR  Cur_Rtre0099 IS
    SELECT  A.FILE_TP,   /*송수신 파일구분  */
            A.FILE_SEQ   /*파일 순번        */
    FROM    RTRE0099 A   /*송수신 작업T     */
    WHERE   A.FILE_TP   = 'CH01_INX' /*송수신파일구분 */
    AND     A.RQST_DAY  = v_Rcrd_Day
    AND     A.FILE_NM   = v_File_Nm
    AND     A.DEL_YN    = 'N'
    AND     A.EXTRC_YN  = 'Y'
    AND     A.CONFI_YN  = 'Y'
    AND     A.FTRAN_YN  = 'N';

    -- 현금영수증 대상
    CURSOR  Cur_Rtre0091 (v_File_Seq NUMBER) IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.CASH_SEQ,                  /*현금영수증 발행 일련*/
            A.CASH_DAY,                  /*현금영수증발행일자  */
            A.FILE_SEQ,                  /*파일순번            */
            A.RECV_DAY,                  /*수납일자            */
            A.RECV_TIME,                 /*수납시간            */
            A.CUST_NO,                   /*고객번호            */
            A.CUST_NM,                   /*고객명              */
            A.CASHD_TP,                  /*거래구분            */
            A.CASHD_FG,                  /*발행대상구분        */
            A.CHI_NO,                    /*현금영수증 식별번호 */
            A.CASH_AMT,                  /*현금영수증 발행금액 */
            A.CASH_NAMT,                 /*현금영수증 발행 공급*/
            A.CASH_VAMT,                 /*현금영수증 발행 부가*/
            A.CASH_STAT,                 /*현금영수증 발행상태 */
            A.CASHAPP_NO,                /*현금영수증 승인번호 */
            A.CSERCD,                    /*발급오류코드        */
            A.CSERMSG,                   /*발급오류메세지      */
            A.OCAPP_NO,                  /*원승인번호          */
            A.OCASH_DAY,                 /*원승인일자          */
            A.CNC_YN                     /*취소여부            */
    FROM    RTRE0091 A
    WHERE   A.CASH_DAY  = v_Rcrd_Day
    AND     A.FILE_SEQ  = v_File_Seq;


    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*송수신파일구분      */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;/*요청일자            */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;/*파일순번            */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW 순번            */

    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;/*파일내용           */
    v_Re0099_Cnt NUMBER DEFAULT 0;                  /*DATA RECORD COUNT   */
    v_Re0091_Cnt NUMBER DEFAULT 0;                  /*DATA RECORD COUNT   */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*데이터 총금액    */
    e_Error EXCEPTION;
  BEGIN

    -- 필수값:카드이체일자,파일명, 등록자 ID
    IF 0 != ISDATE(v_Rcrd_Day) THEN
        v_Return_Message := '카드이체일자('||v_Rcrd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_File_Nm) IS NULL) OR (38 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 초기값 설정
    v_File_Tp  := 'CH01_INX';
    v_Rqst_Day := v_Rcrd_Day;


    -- 기준일자 기준으로 대상집계 내역이 존재하는지 확인하고 1건이 아니면 종료처리하고 오류메시지 제공
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck(v_File_Tp, v_Rqst_Day, v_File_Nm) THEN
        v_Return_Message := '(1)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||') 이미 생성되었거나 집계/대상확인가 안되어 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;


    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR
    FOR CUR IN Cur_Rtre0099 LOOP
        EXIT WHEN Cur_Rtre0099%NOTFOUND;
        v_Re0099_Cnt := v_Re0099_Cnt+1;
        v_File_Tp  := CUR.FILE_TP;
        v_File_Seq := CUR.FILE_SEQ;

        -- 2. 송신 파일 내역 체크 ( RTRE0098 )
        IF 0 < Pkg_Rtre0098.f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN

            -- 2-1) 내역 존재시 DEL_YN 업데이트
            IF 0 != Pkg_Rtre0098.f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존 송신 파일 내역('||v_Rqst_Day||'-'||v_File_Nm||'-'||CUR.FILE_TP||'-'||CUR.FILE_SEQ||') 삭제 실패. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;

    END LOOP;

    --  송수신처리 내역확인 ( RTRE0099 )
    IF 1 != v_Re0099_Cnt THEN
        v_Return_Message := '(1)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||') 이미 생성되었거나 집계/대상확인가 안되어 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;

    IF Cur_Rtre0099%ISOPEN THEN
        CLOSE Cur_Rtre0099;
    END IF;

    -- 송신전문 Data Record 구성 : 파일 내역 생성 ( RTRE0098 )
    FOR CUR IN Cur_Rtre0091(v_File_Seq) LOOP
        EXIT WHEN Cur_Rtre0091%NOTFOUND;
        v_Re0091_Cnt := v_Re0091_Cnt+1;

        -- 데이터 총금액 : SUM(현금영수증 발행금액)
        v_Tdata_Amt := v_Tdata_Amt + NVL(CUR.CASH_AMT,0);


        -- 송신전문 Data Record 구성
        v_Row_Data := SUBSTR(CUR.CASH_DAY, 3, 6)||CUR.RECV_TIME || '|' ||         --거래일자(년월일시분초)
                      CUR.CASHD_TP ||'|' ||                                       --거래타입(승인:7100, 취소:7102)
                      '00000000000000' ||'|' ||                                   --현금영수증 거래번호(승인의 경우 거래번호 없으므로 14자리 0으로 입력) [20171103_02]
                      CUR.CASHD_FG ||'|' ||                                       --공제구분(소비자:0, 사업자:1)
                      CUR.CHI_NO ||'|' ||                                         --식별번호(소비자:휴대폰번호, 주민번호, 카드번호 / 사업자:사업자번호, 카드번호)
                      CUR.CASH_AMT ||'|' ||                                       --거래금액(공급가액 + 봉사료 + 부가가치세)
                      CUR.CASH_NAMT ||'|' ||                                      --공급가액(거래금액/1.1)
--                      CUR.CASH_VAMT ||'|' ||
                      '0' ||'|' ||                                                --봉사료
                      CUR.CASH_VAMT ||'|' ||                                      --부가가치세(거래금액-공급가액)
                      SUBSTRB(CUR.CUST_NM, 1,20*1.5)  ||'|' ||                    --주문자명
                      LPAD(CUR.RECV_SEQ,12,'0')||LPAD(CUR.CASH_SEQ, 3,'0') ||';'; --주문상품명

        -- 송신전문 Data Record - 파일 송수신 내역(RTRE0098) Insert
        Pkg_Rtre0098.p_IUDRtre0098 ('I', v_Rqst_Day, v_File_Nm, v_Row_Seq,
                                    v_File_Tp, v_File_Seq, v_Row_Data, 'N',
                                    v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '송신전문 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    END LOOP;

    IF Cur_Rtre0091%ISOPEN THEN
        CLOSE Cur_Rtre0091;
    END IF;

    -- 현금영수증 대상(RTRE0091)이 없어 처리 불가
    IF 1 > v_Re0091_Cnt THEN
        v_Return_Message := '현금영수증 대상(RTRE0091)이 없어 처리 불가!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;

    -- 송수신 처리내역 업데이트 (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult2 (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                                     'Y', 'N', 'N', v_Re0091_Cnt, v_Tdata_Amt,
                                                     v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송수신 처리내역(RTRE0099) 업데이트 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 파일 송수신 내역 Select
    Pkg_Rtre0098.p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);

    v_Crlf_Yn := 'Y';

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        Pkg_Rtre0098.p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090FileCreate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Rtre0098.p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090FileCreate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0090FileCreate;

END Pkg_Rtre0090;
/
