CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0092 AS
/*******************************************************************************
   NAME      Pkg_Rtre0092
   PURPOSE   현금영수증 실시간 처리 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-30  jemcarry         1. Created this package body.
   1.1        2019-05-31  wjim             [20190429_01] 채권매각계약 현금영수증 발행불가 처리
*******************************************************************************/

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtre0092Count(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,         /*현금영수증 발행 일련*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE         /*현금영수증 이력번호 */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0092
    WHERE   RECV_SEQ  = v_Recv_Seq
    AND     CASH_SEQ  = v_Cash_Seq
    AND     CASH_ISEQ = v_Cash_Iseq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0092Count;

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*취소여부              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.CASH_SEQ,                  /*현금영수증 발행 일련*/
            A.CASH_ISEQ,                 /*현금영수증 이력번호 */
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
            A.CNC_YN,                    /*취소여부            */
            A.CASH_TNO,                  /*현금영수증 거래번호 */
            A.CASHAPP_TM,                /*현금영수증 승인시간 */
            A.CREG_ST,                   /*등록상태코드        */
            A.CREG_DESC,                 /*등록상태설명        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0092 A
    WHERE   A.RECV_SEQ         = DECODE(v_Recv_Seq       , NULL, A.RECV_SEQ        , v_Recv_Seq)
    AND     A.CASH_SEQ         = DECODE(v_Cash_Seq       , NULL, A.CASH_SEQ        , v_Cash_Seq)
    AND     A.CASH_ISEQ        = DECODE(v_Cash_Iseq      , NULL, A.CASH_ISEQ       , v_Cash_Iseq)
    AND     A.CASH_DAY         = DECODE(v_Cash_Day       , NULL, A.CASH_DAY        , v_Cash_Day)
    AND     A.FILE_SEQ         = DECODE(v_File_Seq       , NULL, A.FILE_SEQ        , v_File_Seq)
    AND     A.RECV_DAY         = DECODE(v_Recv_Day       , NULL, A.RECV_DAY        , v_Recv_Day)
    AND     A.RECV_TIME        = DECODE(v_Recv_Time      , NULL, A.RECV_TIME       , v_Recv_Time)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.CUST_NM          = DECODE(v_Cust_Nm        , NULL, A.CUST_NM         , v_Cust_Nm)
    AND     A.CASHD_TP         = DECODE(v_Cashd_Tp       , NULL, A.CASHD_TP        , v_Cashd_Tp)
    AND     A.CASHD_FG         = DECODE(v_Cashd_Fg       , NULL, A.CASHD_FG        , v_Cashd_Fg)
    AND     A.CHI_NO           = DECODE(v_Chi_No         , NULL, A.CHI_NO          , v_Chi_No)
    AND     A.CASH_AMT         = DECODE(v_Cash_Amt       , NULL, A.CASH_AMT        , v_Cash_Amt)
    AND     A.CASH_NAMT        = DECODE(v_Cash_Namt      , NULL, A.CASH_NAMT       , v_Cash_Namt)
    AND     A.CASH_VAMT        = DECODE(v_Cash_Vamt      , NULL, A.CASH_VAMT       , v_Cash_Vamt)
    AND     A.CASH_STAT        = DECODE(v_Cash_Stat      , NULL, A.CASH_STAT       , v_Cash_Stat)
    AND     A.CASHAPP_NO       = DECODE(v_Cashapp_No     , NULL, A.CASHAPP_NO      , v_Cashapp_No)
    AND     A.CSERCD           = DECODE(v_Csercd         , NULL, A.CSERCD          , v_Csercd)
    AND     A.CSERMSG          = DECODE(v_Csermsg        , NULL, A.CSERMSG         , v_Csermsg)
    AND     A.OCAPP_NO         = DECODE(v_Ocapp_No       , NULL, A.OCAPP_NO        , v_Ocapp_No)
    AND     A.OCASH_DAY        = DECODE(v_Ocash_Day      , NULL, A.OCASH_DAY       , v_Ocash_Day)
    AND     A.CNC_YN           = DECODE(v_Cnc_Yn         , NULL, A.CNC_YN          , v_Cnc_Yn)
    AND     A.CASH_TNO         = DECODE(v_Cash_Tno       , NULL, A.CASH_TNO        , v_Cash_Tno)
    AND     A.CASHAPP_TM       = DECODE(v_Cashapp_Tm     , NULL, A.CASHAPP_TM      , v_Cashapp_Tm)
    AND     A.CREG_ST          = DECODE(v_Creg_St        , NULL, A.CREG_ST         , v_Creg_St)
    AND     A.CREG_DESC        = DECODE(v_Creg_Desc      , NULL, A.CREG_DESC       , v_Creg_Desc)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0092;

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0092 (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*취소여부              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0092 (
            RECV_SEQ,
            CASH_SEQ,
            CASH_ISEQ,
            CASH_DAY,
            FILE_SEQ,
            RECV_DAY,
            RECV_TIME,
            CUST_NO,
            CUST_NM,
            CASHD_TP,
            CASHD_FG,
            CHI_NO,
            CASH_AMT,
            CASH_NAMT,
            CASH_VAMT,
            CASH_STAT,
            CASHAPP_NO,
            CSERCD,
            CSERMSG,
            OCAPP_NO,
            OCASH_DAY,
            CNC_YN,
            CASH_TNO,
            CASHAPP_TM,
            CREG_ST,
            CREG_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Cash_Seq,
            v_Cash_Iseq,
            v_Cash_Day,
            v_File_Seq,
            v_Recv_Day,
            v_Recv_Time,
            v_Cust_No,
            v_Cust_Nm,
            v_Cashd_Tp,
            v_Cashd_Fg,
            v_Chi_No,
            v_Cash_Amt,
            v_Cash_Namt,
            v_Cash_Vamt,
            v_Cash_Stat,
            v_Cashapp_No,
            v_Csercd,
            v_Csermsg,
            v_Ocapp_No,
            v_Ocash_Day,
            v_Cnc_Yn,
            v_Cash_Tno,
            v_Cashapp_Tm,
            v_Creg_St,
            v_Creg_Desc,
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

  END f_InsertRtre0092;

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 이력번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0092CashIseq(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE          /*현금영수증 발행 일련*/
    ) RETURN NUMBER IS

    v_Cash_Iseq RTRE0092.CASH_ISEQ%TYPE DEFAULT NULL;   /*현금영수증 이력번호 */
  BEGIN

    SELECT  NVL((SELECT  MAX(CASH_ISEQ)
                 FROM    RTRE0092
                 WHERE   RECV_SEQ  = v_Recv_Seq
                 AND     CASH_SEQ  = v_Cash_Seq)+ 1, 1) AS CASH_ISEQ
    INTO    v_Cash_Iseq
    FROM    DUAL;

    RETURN v_Cash_Iseq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0092CashIseq;

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 현금영수증 발행/취소를 위한 데이터 조회 및 이력 생성 처리 한다.
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-05-31  wjim             [20190429_01] 채권매각계약 현금영수증 발행불가 처리
                                           - 채권매각 기준일(2019-03-31)이후 수납에 대해 현금영수증 발행 불가함
  *****************************************************************************/
  PROCEDURE p_IRtre0092CreateCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*작업구분(C:발행,D:취소*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_Cash_Seq       OUT RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      OUT RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Ordr_Idxx      OUT VARCHAR2,                     /*주문구분번호          */
    v_Good_Nm        OUT VARCHAR2,                     /*상품명                */
    v_Buyr_Nm        OUT VARCHAR2,                     /*주문자명              */
    v_Buyr_Tel       OUT VARCHAR2,                     /*주문자 전화번호       */
    v_Req_Tx         OUT VARCHAR2,                     /*요청 종류             */
    v_Co_Type        OUT VARCHAR2,                     /*사업장 구분           */
    v_Ctax_Type      OUT VARCHAR2,                     /*과세/면세 구분        */
    v_Ctax_No        OUT VARCHAR2,                     /*발행 사업자번호       */
    v_Co_Nm          OUT VARCHAR2,                     /*상호                  */
    v_Cowner_Nm      OUT VARCHAR2,                     /*대표자명              */
    v_Co_Add         OUT VARCHAR2,                     /*사업장 주소           */
    v_Co_Tel         OUT VARCHAR2,                     /*사업장 대표 연락처    */
    v_Trad_Tm        OUT VARCHAR2,                     /*원 거래시각           */
    v_Tr_Code        OUT VARCHAR2,                     /*발행용도              */
    v_Id_Info        OUT VARCHAR2,                     /*신분확인 ID           */
    v_Amt_Tot        OUT VARCHAR2,                     /*거래금액 총 합        */
    v_Amt_Sup        OUT VARCHAR2,                     /*공급가액              */
    v_Amt_Svc        OUT VARCHAR2,                     /*봉사료                */
    v_Amt_Tax        OUT VARCHAR2,                     /*부가가치세            */
    v_Mod_Type       OUT VARCHAR2,                     /*변경 타입             */
    v_Mod_Gb         OUT VARCHAR2,                     /*변경요청 거래번호 구분*/
    v_Mod_Val        OUT VARCHAR2,                     /*변경요청 거래번호     */
    v_Mod_Mny        OUT VARCHAR2,                     /*변경요청 금액         */
    v_Rem_Mny        OUT VARCHAR2,                     /*변경처리 이전 금액    */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Cnc_Yn_Cnt    NUMBER DEFAULT 0;
    v_Chk_Cnt       NUMBER DEFAULT 0;

    v_Cash_Yn    RTRE0030.CASH_YN%TYPE;        /*현금영수증 발행여부   */
    v_Cust_Tp    RTSD0100.CUST_TP%TYPE;        /*고객유형              */
    v_Mob_No     RTSD0100.MOB_NO%TYPE;         /*휴대폰번호            */

    v_Cash_Day   RTRE0092.CASH_DAY%TYPE;       /*현금영수증발행일자    */
    v_File_Seq   RTRE0092.FILE_SEQ%TYPE;       /*파일순번              */
    v_Recv_Day   RTRE0092.RECV_DAY%TYPE;       /*수납일자              */
    v_Recv_Time  RTRE0092.RECV_TIME%TYPE;      /*수납시간              */
    v_Cust_No    RTRE0092.CUST_NO%TYPE;        /*고객번호              */
    v_Cust_Nm    RTRE0092.CUST_NM%TYPE;        /*고객명                */
    v_Cash_Stat  RTRE0092.CASH_STAT%TYPE;      /*현금영수증 발행상태   */
    v_Cashapp_No RTRE0092.CASHAPP_NO%TYPE;     /*현금영수증 승인번호   */
    v_Chi_No     RTRE0092.CHI_NO%TYPE;         /*현금영수증 식별번호   */
    v_Cash_Amt   RTRE0092.CASH_AMT%TYPE;       /*현금영수증 발행금액   */
    v_Cash_Namt  RTRE0092.CASH_NAMT%TYPE;      /*현금영수증 발행 공급가*/
    v_Cash_Vamt  RTRE0092.CASH_VAMT%TYPE;      /*현금영수증 발행 부가세*/
    v_Cashd_Tp   RTRE0092.CASHD_TP%TYPE;       /*거래구분              */
    v_Cashd_Fg   RTRE0092.CASHD_FG%TYPE;       /*발행대상구분          */
    v_Csercd     RTRE0092.CSERCD%TYPE;         /*발급오류코드          */
    v_Csermsg    RTRE0092.CSERMSG%TYPE;        /*발급오류메세지        */
    v_Ocapp_No   RTRE0092.OCAPP_NO%TYPE;       /*원승인번호            */
    v_Ocash_Day  RTRE0092.OCASH_DAY%TYPE;      /*원승인일자            */
    v_Cnc_Yn     RTRE0092.CNC_YN%TYPE;         /*취소여부              */
    v_Cash_Tno   RTRE0092.CASH_TNO%TYPE;       /*현금영수증 거래번호   */
    v_Cashapp_Tm RTRE0092.CASHAPP_TM%TYPE;     /*현금영수증 승인시간   */
    v_Creg_St    RTRE0092.CREG_ST%TYPE;        /*등록상태코드          */
    v_Creg_Desc  RTRE0092.CREG_DESC%TYPE;      /*등록상태설명          */
    v_Reg_Dt     RTRE0092.REG_DT%TYPE;         /*등록일                */

    v_Cash_DayB   RTRE0092.CASH_DAY%TYPE;      /*현금영수증발행일자    */
    v_Cash_StatB  RTRE0092.CASH_STAT%TYPE;     /*현금영수증 발행상태   */
    v_Cashapp_NoB RTRE0092.CASHAPP_NO%TYPE;    /*현금영수증 승인번호   */


  BEGIN

    -- 필수값:
    IF (TRIM(v_Job_Gb) IS NULL) OR (TRIM(v_Job_Gb) NOT IN ('C','D')) THEN
        v_Return_Message := '작업구분(C:발행,D:취소)('||v_Job_Gb||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    BEGIN
        SELECT  A.CASH_YN, A.CUST_NO, B.CUST_NM, B.CUST_TP, B.MOB_NO, A.RECV_DAY, A.REG_DT
        INTO    v_Cash_Yn, v_Cust_No, v_Cust_Nm, v_Cust_Tp, v_Mob_No, v_Recv_Day, v_Reg_Dt
        FROM    RTRE0030 A,
                RTSD0100 B
        WHERE   A.RECV_SEQ = v_Recv_Seq
        AND     A.CUST_NO  = B.CUST_NO
        AND     ROWNUM <= 1;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '수납 내역('||v_Recv_Seq||')의 현금영수증 발행여부 획득 실패하여 처리가 불가 합니다!';
            RAISE e_Error;
    END;

    IF '01' <> v_Cust_Tp THEN
        v_Return_Message := '해당 고객은('||v_Cust_No||')이 개인고객이 아니기 때문에 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- [20190429_01] 채권매각계약 현금영수증 발행 불가
    BEGIN
        SELECT  COUNT(*)
          INTO  v_Chk_Cnt
          FROM  RTRE0030            A1
             ,  RTTEMPIWJ_190429_01 B1
         WHERE  A1.RECV_SEQ = v_Recv_Seq
           AND  A1.ORD_NO   = B1.COL_01
        ;
        
        IF v_Chk_Cnt > 0 THEN
            v_Return_Message := '수납계약중 채권매각 계약이 존재하여 처리가 불가합니다!';
            RAISE e_Error;
        END IF;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '채권매각여부 확인 실패하여 처리가 불가 합니다!';
            RAISE e_Error;
    END;

    SELECT  COUNT(*)
    INTO    v_Cnc_Yn_Cnt
    FROM    RTRE0091
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CNC_YN   = 'N';

    v_Cash_Seq := Pkg_Rtre0091.f_sRtre0091CashSeq(v_Recv_Seq);

    IF v_Job_Gb = 'C' THEN

        IF NVL(v_Cash_Yn,'') <> 'N' THEN
            v_Return_Message := '수납 내역의 현금영수증 발행여부가 ('||v_Cash_Yn||')이므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Cnc_Yn_Cnt > 0 THEN
            v_Return_Message := '발행되었거나 발행중('||TO_CHAR(v_Cnc_Yn_Cnt)||'건)이기 때문에 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        SELECT  MAX( DECODE( NVL(C.CHI_NO, 'N') , 'N', B.MOB_NO, C.CHI_NO)) AS CHI_NO,
                SUM( A.RECP_AMT )                                           AS RECP_AMT,
                ROUND( SUM( A.RECP_AMT) / 1.1 )                             AS RECP_NAMT,
                SUM( A.RECP_AMT ) - ROUND( SUM( A.RECP_AMT ) / 1.1 )        AS RECP_VAMT
        INTO    v_Chi_No, v_Cash_Amt, v_Cash_Namt, v_Cash_Vamt
        FROM    RTRE0030 A,
                RTSD0100 B,
                RTRE0090 C
        WHERE   A.RECV_SEQ = v_Recv_Seq
        AND     A.RECP_TP <> '41' -- 현금영수증 발행대상 제외
        AND     A.RECP_PAY IN ( SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R032' AND USE_YN = 'Y' )
        AND     A.CASH_YN  = 'N'
        AND     A.CNC_STAT = 'N'
        AND     A.RECP_FG  = '01'
        AND     B.CUST_NO  = A.CUST_NO
        AND     B.CUST_TP  = '01'
        AND     C.CUST_NO(+) = A.CUST_NO
        AND     C.STR_DAY(+) <= TO_CHAR(SYSDATE,'YYYYMMDD')
        AND     C.END_DAY(+) >= TO_CHAR(SYSDATE,'YYYYMMDD')
        AND     C.DEL_YN(+)  = 'N';

        v_Cash_Iseq     := f_sRtre0092CashIseq(v_Recv_Seq, v_Cash_Seq);
        v_Cash_Day      :=  TO_CHAR(SYSDATE,'YYYYMMDD');
        v_File_Seq      := '0';
        v_Recv_Time     := TO_CHAR(v_Reg_Dt, 'HH24MISS');
        v_Cashd_Tp      := '7100'; -- 발행
        v_Cashd_Fg      := '0';
        v_Cash_Stat     := '2';
        v_Cashapp_No    := NULL;
        v_Csercd        := NULL;
        v_Csermsg       := NULL;
        v_Ocapp_No      := NULL;
        v_Ocash_Day     := NULL;
        v_Cnc_Yn        := 'N';    -- 발행
        v_Cash_Tno      := NULL;
        v_Cashapp_Tm    := NULL;
        v_Creg_St       := NULL;
        v_Creg_Desc     := NULL;

        IF 0 != f_InsertRtre0092(v_Recv_Seq ,v_Cash_Seq ,v_Cash_Iseq, v_Cash_Day ,v_File_Seq ,
                                 v_Recv_Day ,v_Recv_Time ,v_Cust_No ,v_Cust_Nm ,
                                 v_Cashd_Tp ,v_Cashd_Fg ,v_Chi_No ,v_Cash_Amt ,
                                 v_Cash_Namt ,v_Cash_Vamt ,v_Cash_Stat ,v_Cashapp_No ,
                                 v_Csercd ,v_Csermsg ,v_Ocapp_No ,v_Ocash_Day ,
                                 v_Cnc_Yn ,v_Cash_Tno ,v_Cashapp_Tm ,v_Creg_St ,
                                 v_Creg_Desc ,v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '현금영수증 실시간 처리 이력 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;



        v_Ordr_Idxx := v_Cust_No||v_Recv_Seq||v_Cash_Seq;  /*주문구분번호          */
        v_Good_Nm   := '넥센타이어 렌탈';                  /*상품명                */
        v_Buyr_Nm   := v_Cust_Nm;                          /*주문자명              */
        v_Buyr_Tel  := v_Mob_No;                           /*주문자 전화번호       */
        v_Req_Tx    := 'pay';                              /*요청 종류             */
        v_Co_Type   := '0';                                /*사업장 구분           */
        v_Ctax_Type := 'TG01';                             /*과세/면세 구분        */
        v_Ctax_No   := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R023', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R023' )); /*발행 사업자번호       */
        v_Co_Nm     := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R045', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R045' )); /*상호                  */
        v_Cowner_Nm := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R046', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R046' )); /*대표자명              */
        v_Co_Add    := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R047', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R047' )); /*사업장 주소           */
        v_Co_Tel    := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R048', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R048' )); /*사업장 대표 연락처    */

        v_Trad_Tm   := v_Cash_Day||v_Recv_Time;            /*원 거래시각           */
        v_Tr_Code   := '0';                                /*발행용도              */
        v_Id_Info   := v_Chi_No;                           /*신분확인 ID           */
        v_Amt_Tot   := v_Cash_Amt;                         /*거래금액 총 합        */
        v_Amt_Sup   := v_Cash_Namt;                        /*공급가액              */
        v_Amt_Svc   := '0';                                /*봉사료                */
        v_Amt_Tax   := v_Cash_Vamt;                        /*부가가치세            */

    ELSIF v_Job_Gb = 'D' THEN

        IF NVL(v_Cash_Yn,'') <> 'Y' THEN
            v_Return_Message := '수납 내역의 현금영수증 발행여부가 ('||v_Cash_Yn||')이므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Cnc_Yn_Cnt <> 1 THEN
            v_Return_Message := '발행건('||TO_CHAR(v_Cnc_Yn_Cnt)||') 오류로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        SELECT  RECV_DAY, RECV_TIME, CUST_NO, CUST_NM,
                CHI_NO, CASH_AMT, CASH_NAMT, CASH_VAMT,
                CASH_STAT, CASHAPP_NO, CASH_DAY
        INTO    v_Recv_Day, v_Recv_Time, v_Cust_No, v_Cust_Nm,
                v_Chi_No, v_Cash_Amt, v_Cash_Namt, v_Cash_Vamt,
                v_Cash_StatB, v_Cashapp_NoB, v_Cash_DayB
        FROM    RTRE0091
        WHERE   RECV_SEQ = v_Recv_Seq
        AND     CNC_YN   = 'N';

        IF (TRIM(v_Cash_StatB) IS NULL) OR (TRIM(v_Cash_StatB) <> 5) THEN
            v_Return_Message := '발행된 내역('||v_Cash_StatB||')이 없기 때문에 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        v_Cash_Iseq     := f_sRtre0092CashIseq(v_Recv_Seq, v_Cash_Seq);
        v_Cash_Day      :=  TO_CHAR(SYSDATE,'YYYYMMDD');
        v_File_Seq      := '0';
        v_Recv_Time     := TO_CHAR(v_Reg_Dt, 'HH24MISS');
        v_Cashd_Tp      := '7102'; -- 취소
        v_Cashd_Fg      := '0';
        v_Cash_Stat     := '2';
        v_Cashapp_No    := NULL;
        v_Csercd        := NULL;
        v_Csermsg       := NULL;
        v_Ocapp_No      := v_Cashapp_NoB;
        v_Ocash_Day     := v_Cash_DayB;
        v_Cnc_Yn        := 'Y';    -- 취소
        v_Cash_Tno      := NULL;
        v_Cashapp_Tm    := NULL;
        v_Creg_St       := NULL;
        v_Creg_Desc     := NULL;

        IF 0 != f_InsertRtre0092(v_Recv_Seq ,v_Cash_Seq ,v_Cash_Iseq, v_Cash_Day ,v_File_Seq ,
                                 v_Recv_Day ,v_Recv_Time ,v_Cust_No ,v_Cust_Nm ,
                                 v_Cashd_Tp ,v_Cashd_Fg ,v_Chi_No ,v_Cash_Amt ,
                                 v_Cash_Namt ,v_Cash_Vamt ,v_Cash_Stat ,v_Cashapp_No ,
                                 v_Csercd ,v_Csermsg ,v_Ocapp_No ,v_Ocash_Day ,
                                 v_Cnc_Yn ,v_Cash_Tno ,v_Cashapp_Tm ,v_Creg_St ,
                                 v_Creg_Desc ,v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '현금영수증 실시간 처리 이력 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

        v_Req_Tx    := 'mod';                              /*요청 종류             */
        v_Trad_Tm   := v_Ocash_Day||v_Recv_Time;           /*원 거래시각           */
        v_Mod_Type  := 'STSC';                             /*변경 타입             */
        v_Mod_Gb    := 'MG02';                             /*변경요청 거래번호 구분*/
        v_Mod_Val   := v_Cashapp_NoB;                      /*변경요청 거래번호     */
        v_Mod_Mny   := ' ';                                /*변경요청 금액         */
        v_Rem_Mny   := ' ';                                /*변경처리 이전 금액    */

    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092CreateCashApp(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092CreateCashApp(2)', v_ErrorText, v_Return_Message);

  END p_IRtre0092CreateCashApp;

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 현금영수증 발행/취소 실시간 결과 정보를 업데이트 한다.
  *****************************************************************************/
  FUNCTION f_UpdateRtre0092ResultCashApp (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0092
    SET    CASH_STAT  = v_Cash_Stat,
           CASHAPP_NO = v_Cashapp_No,
           CSERCD     = v_Csercd,
           CSERMSG    = v_Csermsg,
           CASH_TNO   = v_Cash_Tno,
           CASHAPP_TM = v_Cashapp_Tm,
           CREG_ST    = v_Creg_St,
           CREG_DESC  = v_Creg_Desc,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RECV_SEQ   = v_Recv_Seq
    AND    CASH_SEQ   = v_Cash_Seq
    AND    CASH_ISEQ  = v_Cash_Iseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0092ResultCashApp;


  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 현금영수증 발행/취소 실시간 결과 정보를 업데이트 한다.
  *****************************************************************************/
  PROCEDURE p_IRtre0092ResultCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*작업구분(C:발행,D:취소*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN  RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN  RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Res_Cd         IN  VARCHAR2,                     /*결과코드              */
    v_Res_Msg        IN  VARCHAR2,                     /*결과메시지            */
    v_Cash_Tno       IN  RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_No     IN  RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Cashapp_Tm     IN  RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN  RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN  RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Cash_Stat RTRE0092.CASH_STAT%TYPE;               /*현금영수증 발행상태   */
    v_Cash_Yn   RTRE0030.CASH_YN%TYPE;                 /*현금영수증 발행여부   */

  BEGIN

    -- 필수값:
    IF (TRIM(v_Job_Gb) IS NULL) OR (TRIM(v_Job_Gb) NOT IN ('C','D')) THEN
        v_Return_Message := '작업구분(C:발행,D:취소)('||v_Job_Gb||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Seq) IS NULL THEN
        v_Return_Message := '현금영수증 발행 일련번호('||v_Cash_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Iseq) IS NULL THEN
        v_Return_Message := '현금영수증 이력번('||v_Cash_Iseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0092Count(v_Recv_Seq, v_Cash_Seq, v_Cash_Iseq) THEN
        v_Return_Message := '현금영수증 실시간 처리 이력('||v_Recv_Seq||'-'||v_Cash_Seq||'-'||v_Cash_Iseq||')이 없으므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Res_Cd) IS NULL THEN
        v_Return_Message := '발급오류코드('||v_Res_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Res_Msg) IS NULL THEN
        v_Return_Message := '발급오류메시지('||v_Res_Msg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Res_Cd) = '0000' THEN   /* 정상처리시 */

        IF TRIM(v_Cash_Tno) IS NULL THEN
            v_Return_Message := '현금영수증 거래번호('||v_Cash_Tno||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cashapp_No) IS NULL THEN
            v_Return_Message := '현금영수증 승인번호('||v_Cashapp_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cashapp_Tm) IS NULL THEN
            v_Return_Message := '현금영수증 승인시간('||v_Cashapp_Tm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    -- 작업구분(C:발행,D:취소)
    IF TRIM(v_Job_Gb) = 'C' THEN
        v_Cash_Stat := '5'; -- 현금영수증 발행상태 (5:정상발행)
        v_Cash_Yn   := 'Y'; -- 현금영수증 발행여부 (Y:발행)
    ELSIF TRIM(v_Job_Gb) = 'D' THEN
        v_Cash_Stat := '8'; -- 현금영수증 발행상태 (8:취소)
        v_Cash_Yn   := 'N'; -- 현금영수증 발행여부 (N:미발행)
    END IF;

    --  현금영수증 발행/취소 실시간 결과 정보를 업데이트 한다.
    IF 0 != f_UpdateRtre0092ResultCashApp (
                    v_Recv_Seq,         /*수납거래번호          */
                    v_Cash_Seq,         /*현금영수증 발행 일련번*/
                    v_Cash_Iseq,        /*현금영수증 이력번호   */
                    v_Cash_Stat,        /*현금영수증 발행상태   */
                    TRIM(v_Cashapp_No), /*현금영수증 승인번호   */
                    TRIM(v_Res_Cd),     /*발급오류코드          */
                    TRIM(v_Res_Msg),    /*발급오류메세지        */
                    TRIM(v_Cash_Tno),   /*현금영수증 거래번호   */
                    TRIM(v_Cashapp_Tm), /*현금영수증 승인시간   */
                    TRIM(v_Creg_St),    /*등록상태코드          */
                    TRIM(v_Creg_Desc),  /*등록상태설명          */
                    v_Reg_Id,           /*등록자 ID             */
                    v_ErrorText
                    ) THEN
        v_Return_Message := '현금영수증 실시간 처리 이력(RTRE0092) 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    IF 0 != v_Success_code THEN
        v_Return_Message := '현금영수증 실시간 처리 이력(RTRE0092) 기준으로 현금영수증발급내역(RTRE0091) 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    IF TRIM(v_Res_Cd) = '0000' THEN

    -- 현금영수증 실시간 처리 이력(RTRE0092) 기준으로 현금영수증발급내역(RTRE0091) 등록
        BEGIN

            INSERT  INTO RTRE0091 (
                    RECV_SEQ,CASH_SEQ,CASH_DAY,FILE_SEQ,
                    RECV_DAY,RECV_TIME,CUST_NO,CUST_NM,
                    CASHD_TP,CASHD_FG,CHI_NO,CASH_AMT,
                    CASH_NAMT,CASH_VAMT,CASH_STAT,CASHAPP_NO,
                    CSERCD,CSERMSG,OCAPP_NO,OCASH_DAY,
                    CNC_YN,REG_ID,REG_DT,CHG_ID,CHG_DT
                    )
            SELECT  RECV_SEQ,CASH_SEQ,CASH_DAY,FILE_SEQ,
                    RECV_DAY,RECV_TIME,CUST_NO,CUST_NM,
                    CASHD_TP,CASHD_FG,CHI_NO,CASH_AMT,
                    CASH_NAMT,CASH_VAMT,CASH_STAT,CASHAPP_NO,
                    CSERCD,CSERMSG,OCAPP_NO,OCASH_DAY,
                    CNC_YN,v_Reg_Id,SYSDATE,v_Reg_Id,SYSDATE
            FROM    RTRE0092
            WHERE   RECV_SEQ  = v_Recv_Seq
            AND     CASH_SEQ  = v_Cash_Seq
            AND     CASH_ISEQ = v_Cash_Iseq;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '현금영수증 이력(RTRE0092) 기준으로 현금영수증발급내역(RTRE0091) 등록 실패하여 처리가 불가 합니다! - '||SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
        END;

        -- 수납 내역 Update -  현금영수증 발행여부(CASH_YN) 에 v_Job_Gb이 'C'이명 'Y', v_Job_Gb이 'C'이명 'N' 값으로 업데이트 한다.
        IF 0 != Pkg_Rtre0030.f_UpdateRtre0030Aggregate (v_Recv_Seq, v_Cash_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '현금영수증 발행여부(RTRE0030.CASH_YN)에 업데이트 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


        -- 취소일 경우
        IF TRIM(v_Job_Gb) = 'D' THEN

            -- 현금영수증 실시간 처리 이력(RTRE0092) 기준으로 현금영수증발급내역(RTRE0091) 업데이트(연결고리)
            BEGIN

                UPDATE  RTRE0091 A
                SET     (A.CNC_YN, A.OCAPP_NO, A.OCASH_DAY) =
                        (
                        SELECT  'Y', B.CASHAPP_NO, B.CASH_DAY
                        FROM    RTRE0092 B
                        WHERE   B.RECV_SEQ   = v_Recv_Seq
                        AND     B.CASH_SEQ   = v_Cash_Seq
                        AND     B.CASH_ISEQ  = v_Cash_Iseq
                        AND     A.CASHAPP_NO = B.OCAPP_NO
                        AND     A.CASH_DAY   = B.OCASH_DAY
                        )
                WHERE   (A.CASHAPP_NO, A.CASH_DAY) =
                        (
                        SELECT  B.OCAPP_NO, B.OCASH_DAY
                        FROM    RTRE0092 B
                        WHERE   B.RECV_SEQ  = v_Recv_Seq
                        AND     B.CASH_SEQ  = v_Cash_Seq
                        AND     B.CASH_ISEQ = v_Cash_Iseq
                        );

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '현금영수증 이력(RTRE0092) 기준으로 현금영수증발급내역(RTRE0091) 업데이트 실패하여 처리가 불가 합니다! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;

        END IF;

        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
    --COMMIT;
    END IF;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092ResultCashApp(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092ResultCashApp(2)', v_ErrorText, v_Return_Message);

  END p_IRtre0092ResultCashApp;


END Pkg_Rtre0092;