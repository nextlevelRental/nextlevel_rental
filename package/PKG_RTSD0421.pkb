CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0421 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0421
    PURPOSE     도착알림문자발송내역
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 도착알림문자 발송내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0421 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTSD0421.ORD_NO%TYPE                  /*주문번호             */
    , v_Cust_No         IN RTSD0420.CUST_NO%TYPE                 /*고객번호             */
    , v_Ord_Day_F       IN RTSD0104.ORD_DAY%TYPE                 /*접수일자             */
    , v_Ord_Day_T       IN RTSD0104.ORD_DAY%TYPE                 /*접수일자             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE                /*고객번호             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.ORD_NO
    ,  A.INVOICE_NO
    ,  A.LOGISTICS
    ,  A.GI_DAY
    ,  A.SEND_CNT
    ,  A.MOB_NO
    ,  A.SMS_TYPE
    ,  A.ORDER_TYPE
    ,  A.SEND_DAY
    ,  A.DELIVERY_TYPE
    ,  B.SEQ
    ,  B.REG_ID
    ,  C.RESERVED_DTTM
    ,  C.RCV_PHN_ID
    ,  C.SND_PHN_ID
    ,  C.SND_MSG
    ,  D.CUST_NO
    ,  D.CUST_NM
    ,  Pkg_Rtsd0421.f_GetSendHist(A.ORD_NO, 1) AS FIRST_DAY
    FROM RTSD0420 A
    ,    RTSD0421 B
    ,    RTSD0205 C
    ,    RTSD0100 D
    ,    RTSD0104 E
    WHERE 1=1
    AND A.SEND_CNT > 0
    AND A.ORD_NO = B.ORD_NO
    AND A.ORDER_TYPE = B.ORDER_TYPE
    AND B.CMP_MSG_ID = C.CMP_MSG_ID
    AND A.CUST_NO = D.CUST_NO
    AND A.ORD_NO = E.ORD_NO
    AND A.ORD_NO = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
    AND A.CUST_NO = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
    AND B.SEND_CNT = DECODE(v_Send_Cnt, NULL, B.SEND_CNT, v_Send_Cnt)
    AND (v_Ord_Day_F IS NULL OR E.ORD_DAY BETWEEN v_Ord_Day_F AND v_Ord_Day_T)
    ORDER BY A.ORD_NO, B.SEND_CNT, B.SEQ
    ;

  END p_sRTSD0421; 
   
  /*****************************************************************************
  --발송내역 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0421Count(
      v_Ord_No          IN RTSD0421.ORD_NO%TYPE                 /*주문번호            */
    , v_Order_Type      IN RTSD0421.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL(MAX(SEQ), 0)
    INTO    v_curr_cunt
    FROM    RTSD0421
    WHERE   ORD_NO = v_Ord_No
    AND     ORDER_TYPE = v_Order_Type
    AND     SEND_CNT = v_Send_Cnt;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0421Count;
  
  /*****************************************************************************
  -- 도착알림문자발송내역(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0421 (
      v_Comm_Dvsn       IN CHAR                                 /*처리구분(I,U,D)      */
    , v_Ord_No          IN RTSD0421.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0421.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
    , v_Cmp_Msg_Id      IN RTSD0421.CMP_MSG_ID%TYPE             /*발송 ID            */
    , v_Reg_Id          IN RTSD0421.REG_ID%TYPE                 /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS 
  e_Error EXCEPTION;
  
  v_Seq NUMBER;
  
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        v_Seq := f_sRtsd0421Count(v_Ord_No, v_Order_Type, v_Send_Cnt);
        
        IF 0 != f_InsertRtsd0421(
              v_Ord_No 
            , v_Order_Type 
            , v_Send_Cnt  
            , v_Seq + 1
            , v_Cmp_Msg_Id   
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

  END p_IUDRtsd0421;
   
  /*****************************************************************************
  -- 도착알림문자발송내역 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0421 (
      v_Ord_No          IN RTSD0421.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0421.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
    , v_Seq             IN RTSD0421.SEQ%TYPE                    /*순번                */
    , v_Cmp_Msg_Id      IN RTSD0421.CMP_MSG_ID%TYPE             /*발송 ID            */
    , v_Reg_Id          IN RTSD0421.REG_ID%TYPE                  /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0421 (
          ORD_NO
        , ORDER_TYPE
        , SEND_CNT
        , SEQ
        , CMP_MSG_ID
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Ord_No   
        , v_Order_Type 
        , v_Send_Cnt
        , v_Seq
        , v_Cmp_Msg_Id   
        , v_Reg_Id            
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0421;
  
  /*****************************************************************************
  -- 도착알림문자 발송내역
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-10-13  kstka            [20211013_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_GetSendHist (
      v_Ord_No            IN RTSD0420.ORD_NO%TYPE,              /*주문번호             */
      v_Send_Cnt        IN RTSD0421.SEND_CNT%TYPE               /*발송횟수             */
  ) RETURN VARCHAR IS
  
  v_Send_Dt VARCHAR2(8);
  BEGIN

    
        SELECT TO_CHAR(REG_DT, 'YYYYMMDD')
         INTO v_Send_Dt
        FROM RTSD0421
        WHERE 1=1
        AND ORD_NO = v_Ord_No
        AND SEND_CNT = v_Send_Cnt;
       
    RETURN v_Send_Dt;

    EXCEPTION
      WHEN OTHERS THEN
--        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN '';

  END f_GetSendHist;
  
END Pkg_Rtsd0421;
/
