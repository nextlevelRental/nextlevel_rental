CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0420 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0420
    PURPOSE     도착알림문자내역
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
    2.0     2021-12-29  kstka            [20211229_01] 초기집계시 방문장착,Pick and Delivery 제외
*******************************************************************************/
  
  /*****************************************************************************
  -- 도착알림문자내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*발송일자            */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*중지대상            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제대상            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                 /*등록자            */
    , v_Next_Send_Day   IN RTSD0420.SEND_DAY%TYPE               /*다음발송일자            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*배송유형            */
  ) IS 

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SEND_DAY
          , A.ORD_NO
          , A.ORDER_TYPE
          , NVL(INVOICE_NO, D.ZPARCELINVOICE) AS INVOICE_NO
          , NVL(A.LOGISTICS, D.ZCOMPANY) AS LOGISTICS
          , A.SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , A.SMS_TYPE
          , CASE WHEN A.SEND_CNT = 9 THEN NULL ELSE TO_CHAR(TO_DATE(NVL(C.SEND_DAY, A.SEND_DAY)) + 7, 'YYYYMMDD') END AS NEXT_SEND_DAY -- 마지막횟수는 계산하지 않는다.
          , A.DELIVERY_TYPE
          , A.CUST_NO
          , A.CUST_NM
          , A.DEL_YN
          , CASE WHEN A.HOLD_YN = 'Y' THEN '1' ELSE '0' END AS HOLD_YN
          , F.MAT_CD
          , F.MAT_NM
          , B.AGENCY_CD
          , G.AGENCY_NM
          , G.RENTAL_GROUP
          , Pkg_Rtcm0051.f_sRtcm0051CodeName('S301', G.RENTAL_GROUP) AS RENTAL_GROUP_NM
          , G.RENTAL_OFFICE
          , Pkg_Rtcm0051.f_sRtcm0051CodeName('S302', G.RENTAL_OFFICE) AS RENTAL_OFFICE_NM   
          , B.CNT_CD
          , A.LOGISTICS_STATUS
          , Pkg_Rtcm0051.f_sRtcm0051CodeName('S312', A.LOGISTICS_STATUS) AS LOGISTICS_STATUS_NM          
      FROM  RTSD0420 A
          , (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEND_CNT DESC) NUM, ORD_NO, SEQ, TO_CHAR(REG_DT, 'YYYYMMDD') SEND_DAY FROM RTSD0421) C
          , RTSD0104 B
          , RTSD0115 D
          , RTSD0106 E
          , RTSD0005 F
          , RTSD0007 G
     WHERE  1=1
       AND  A.ORD_NO = B.ORD_NO
       AND  B.STAT_CD = '01'        --접수건만 조회 가능
       AND  A.ORD_NO = C.ORD_NO(+)
       AND  C.NUM(+) = 1
       AND  A.ORD_NO = D.ORD_NO
       AND  D.TRANS_TP = 'N'
       AND  B.ORD_NO = E.ORD_NO
       AND  E.MAT_CD = F.MAT_CD
       AND  B.AGENCY_CD = G.AGENCY_CD
       AND  A.ORD_NO          = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
       AND  (INVOICE_NO IS NULL OR INVOICE_NO      = DECODE(v_Invoice_No, NULL, INVOICE_NO, v_Invoice_No))
       AND  SEND_CNT        = DECODE(v_Send_Cnt, NULL, SEND_CNT, v_Send_Cnt)
       AND  GI_YN           = DECODE(v_Gi_Yn, NULL, GI_YN, v_Gi_Yn)
       AND  HOLD_YN           = DECODE(v_Hold_Yn, NULL, HOLD_YN, v_Hold_Yn)
       AND  DEL_YN           = DECODE(v_Del_Yn, NULL, DEL_YN, v_Del_Yn)
       AND  SMS_TYPE        = DECODE(v_Sms_Type, NULL, SMS_TYPE, v_Sms_Type)
       AND  A.SEND_DAY        = DECODE(v_Send_Day, NULL, A.SEND_DAY, v_Send_Day)
       AND  DELIVERY_TYPE   = DECODE(v_Delivery_Type, NULL, DELIVERY_TYPE, v_Delivery_Type)
       AND  (v_Next_Send_Day IS NULL OR TO_CHAR(TO_DATE(NVL(C.SEND_DAY, A.SEND_DAY)) + 7, 'YYYYMMDD') = DECODE(v_Next_Send_Day, NULL, TO_CHAR(TO_DATE(NVL(C.SEND_DAY, A.SEND_DAY)) + 7, 'YYYYMMDD'), v_Next_Send_Day))
       AND  DEL_YN = 'N'
     UNION ALL
     SELECT  A.SEND_DAY
          , A.ORD_NO
          , A.ORDER_TYPE
          , NVL(INVOICE_NO, D.ZPARCELINVOICE) AS INVOICE_NO
          , NVL(A.LOGISTICS, D.ZCOMPANY) AS LOGISTICS
          , A.SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , A.SMS_TYPE
          , CASE WHEN A.SEND_CNT = 9 THEN NULL ELSE TO_CHAR(TO_DATE(NVL(C.SEND_DAY, A.SEND_DAY)) + 7, 'YYYYMMDD') END AS NEXT_SEND_DAY -- 마지막횟수는 계산하지 않는다.
          , A.DELIVERY_TYPE
          , A.CUST_NO
          , A.CUST_NM
          , A.DEL_YN
          , CASE WHEN A.HOLD_YN = 'Y' THEN '1' ELSE '0' END AS HOLD_YN
          , E.MAT_CD
          , E.MAT_NM
          , B.AGENCY_CD
          , F.AGENCY_NM
          , F.RENTAL_GROUP
          , Pkg_Rtcm0051.f_sRtcm0051CodeName('S301', F.RENTAL_GROUP) AS RENTAL_GROUP_NM
          , F.RENTAL_OFFICE
          , Pkg_Rtcm0051.f_sRtcm0051CodeName('S302', F.RENTAL_OFFICE) AS RENTAL_OFFICE_NM
          , B.KWMENG AS CNT_CD
          , A.LOGISTICS_STATUS
          , Pkg_Rtcm0051.f_sRtcm0051CodeName('S312', A.LOGISTICS_STATUS) AS LOGISTICS_STATUS_NM
      FROM  RTSD0420 A
          , (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEND_CNT DESC) NUM, ORD_NO, SEQ, TO_CHAR(REG_DT, 'YYYYMMDD') SEND_DAY FROM RTSD0421) C
          , (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY ORD_NO, DLVR_DAY) AS NUM, ORD_NO, DLV_STAT, AGENCY_CD, MATNR, KWMENG FROM RTCS0010 WHERE DLV_STAT NOT IN ('06')) B
          , RTSD0115 D
          , RTSD0005 E
          , RTSD0007 F
     WHERE  1=1
       AND  A.ORD_NO = B.ORD_NO
       AND  B.DLV_STAT IN ('02', '03')        --접수건만 조회 가능
       AND  A.ORD_NO = C.ORD_NO(+)
       AND  C.NUM(+) = 1
       AND  A.ORD_NO = D.ORD_NO
       AND  D.TRANS_TP = 'S' || B.NUM
       AND  B.MATNR = E.MAT_CD
       AND  B.AGENCY_CD = F.AGENCY_CD
       AND  A.ORD_NO          = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
       AND  (INVOICE_NO IS NULL OR INVOICE_NO      = DECODE(v_Invoice_No, NULL, INVOICE_NO, v_Invoice_No))
       AND  SEND_CNT        = DECODE(v_Send_Cnt, NULL, SEND_CNT, v_Send_Cnt)
       AND  GI_YN           = DECODE(v_Gi_Yn, NULL, GI_YN, v_Gi_Yn)
       AND  HOLD_YN           = DECODE(v_Hold_Yn, NULL, HOLD_YN, v_Hold_Yn)
       AND  DEL_YN           = DECODE(v_Del_Yn, NULL, DEL_YN, v_Del_Yn)
       AND  SMS_TYPE        = DECODE(v_Sms_Type, NULL, SMS_TYPE, v_Sms_Type)
       AND  A.SEND_DAY        = DECODE(v_Send_Day, NULL, A.SEND_DAY, v_Send_Day)
       AND  DELIVERY_TYPE   = DECODE(v_Delivery_Type, NULL, DELIVERY_TYPE, v_Delivery_Type)
       AND  (v_Next_Send_Day IS NULL OR TO_CHAR(TO_DATE(NVL(C.SEND_DAY, A.SEND_DAY)) + 7, 'YYYYMMDD') = DECODE(v_Next_Send_Day, NULL, TO_CHAR(TO_DATE(NVL(C.SEND_DAY, A.SEND_DAY)) + 7, 'YYYYMMDD'), v_Next_Send_Day))
       AND  DEL_YN = 'N'
    ; 

  END p_sRTSD0420; 
   
  
  /*****************************************************************************
  --집계내역 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0420Count(
      v_Ord_No             IN RTSD0420.ORD_NO%TYPE                /*주문번호            */
    , v_Order_Type         IN RTSD0420.ORDER_TYPE%TYPE            /*주문유형            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0420
    WHERE   ORD_NO = v_Ord_No
    AND     ORDER_TYPE = v_Order_Type;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0420Count;
  
  /*****************************************************************************
  -- 도착알림문자내역 최초 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
    2.0     2021-12-29  kstka            [20211229_01] 초기집계시 방문장착,Pick and Delivery 제외
  *****************************************************************************/
  PROCEDURE p_sRTSD0420Aggregate (
      v_Day_F           IN VARCHAR2                 /*시작일             */
    , v_Day_T           IN VARCHAR2                 /*종료일             */
    , v_Reg_Id          IN VARCHAR2                 /*등록자             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*데이타 존재여부       */
    
    v_Cmp_Msg_Id RTSD0205.CMP_MSG_ID%TYPE;             /*발송번호             */
    v_Snd_Msg RTSD0205.SND_MSG%TYPE;                   /*발송문구             */   
  BEGIN

    INSERT INTO RTSD0420 (
                            SEND_DAY
                           ,ORD_NO
                           ,CUST_NO
                           ,CUST_NM
                           ,ORDER_TYPE
                           ,INVOICE_NO
                           ,LOGISTICS
                           ,SEND_CNT
                           ,GI_DAY
                           ,GI_YN
                           ,MOB_NO
                           ,SMS_TYPE
                           ,DELIVERY_TYPE
                           ,DEL_YN
                           ,HOLD_YN
                           ,REG_ID
                           ,REG_DT
                           ,CHG_ID
                           ,CHG_DT
                          )
    SELECT  TO_CHAR(SYSDATE, 'YYYYMMDD')
          , B.ORD_NO
          , E.CUST_NO
          , E.CUST_NM
          , 'A' AS ORDER_TYPE
          , NVL(A.INVOICE_NO, C.ZParcelInvoice) AS INVOICE_NO
          , NVL(A.LOGISTICS, C.Zcompany) AS LOGISTICS
          , NVL(A.SEND_CNT, 0) AS SEND_CNT
          , D.GI_DAY AS GI_DAY
--          , CASE WHEN TRIM(C.BEZEI) IN ('택배', '지정일출고') OR TRIM(C.Zcompany) IS NOT NULL OR TRIM(C.ZParcelInvoice) IS NOT NULL THEN 'Y' ELSE NVL(A.GI_YN, 'N') END AS GI_YN
          , 'N' AS GI_YN
          , E.MOB_NO
          , '01' AS SMS_TYPE
          , CASE WHEN TRIM(C.BEZEI) IN ('택배', '지정일출고') OR TRIM(C.Zcompany) IS NOT NULL OR TRIM(C.ZParcelInvoice) IS NOT NULL THEN '02' ELSE '01' END AS DELIVERY_TYPE
          , 'N' AS DEL_YN
          , 'N' AS HOLD_YN
          , v_Reg_Id
          , SYSDATE
          , v_Reg_Id
          , SYSDATE
      FROM  RTSD0420 A
          , RTSD0104 B
          , RTSD0115 C
          , RTSD0116 D
          , RTSD0100 E
     WHERE  1=1
       AND  A.ORD_NO(+) = B.ORD_NO
       AND  B.ORD_NO = C.ORD_NO
       AND  C.ORD_NO = D.ORD_NO
       AND  C.VBELN = D.VBELN
       AND  C.TRANS_TP = 'N'
       AND  B.STAT_CD IN ('01')
       AND  B.CHAN_CD IN ('02', '03', '04')
       AND  B.CUST_NO = E.CUST_NO
       AND  NVL(B.INST_CD, '1030') NOT IN ('1010', '1020')   
       AND  D.GI_DAY BETWEEN v_Day_F AND v_Day_T
       AND  NOT EXISTS (SELECT 1 FROM RTSD0420 X WHERE X.ORD_NO = B.ORD_NO) -- 기존 집계된 대상은 제외
    UNION ALL   --걱정제로 포함
    SELECT  TO_CHAR(SYSDATE, 'YYYYMMDD') 
          , B.ORD_NO
          , E.CUST_NO
          , E.CUST_NM
          , 'B' AS ORDER_TYPE
          , NVL(A.INVOICE_NO, C.ZParcelInvoice) AS INVOICE_NO
          , NVL(A.LOGISTICS, C.Zcompany) AS LOGISTICS
          , NVL(A.SEND_CNT, 0) AS SEND_CNT
          , D.GI_DAY AS GI_DAY
--          , CASE WHEN TRIM(C.BEZEI) IN ('택배', '지정일출고') OR TRIM(C.Zcompany) IS NOT NULL OR TRIM(C.ZParcelInvoice) IS NOT NULL THEN 'Y' ELSE NVL(A.GI_YN, 'N') END AS GI_YN
          , 'N' AS GI_YN
          , E.MOB_NO
          , '11' AS SMS_TYPE
          , CASE WHEN TRIM(C.BEZEI) IN ('택배', '지정일출고') OR TRIM(C.Zcompany) IS NOT NULL OR TRIM(C.ZParcelInvoice) IS NOT NULL THEN '02' ELSE '01' END AS DELIVERY_TYPE
          , 'N' AS DEL_YN
          , 'N' AS HOLD_YN
          , v_Reg_Id
          , SYSDATE
          , v_Reg_Id
          , SYSDATE
      FROM RTSD0420 A
        ,  (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY DLVR_DAY, DLVR_SEQ) NUM, ORD_NO, CUST_NO, DLV_STAT, DLVR_DAY, INST_CD FROM RTCS0010 WHERE DLV_STAT NOT IN ('06')) B
        ,  RTSD0115 C
        ,  RTSD0116 D
        ,  RTSD0100 E
      WHERE 1=1
        AND  A.ORD_NO(+) = B.ORD_NO
        AND  B.ORD_NO = C.ORD_NO
        AND  TO_CHAR(B.NUM)    = TO_CHAR(C.NUM)
        AND  C.ORD_NO = D.ORD_NO
        AND  C.VBELN = D.VBELN
        AND  C.NUM = D.NUM
        AND  C.TRANS_TP LIKE 'S%'
        AND  B.DLV_STAT IN ('02', '03')
        AND  B.CUST_NO = E.CUST_NO
        AND  NVL(B.INST_CD, '1030') NOT IN ('1010')  
        AND  D.GI_DAY BETWEEN v_Day_F AND v_Day_T
        AND  NOT EXISTS (SELECT 1 FROM RTSD0420 X WHERE X.ORD_NO = B.ORD_NO)    -- 기존 집계된 내역은 제외
    ; 
   
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

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
        
  END p_sRTSD0420Aggregate; 
   
  /*****************************************************************************
  -- 도착알림문자내역 최초 집계 문자 발송
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420SendMsg (
      v_Send_Day       IN RTSD0420.SEND_DAY%TYPE                 /*시작일             */
    , v_Send_Cnt       IN RTSD0420.SEND_CNT%TYPE
    , v_Reg_Id         IN VARCHAR2
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*데이타 존재여부       */
    
  BEGIN
  
  
    IF v_Send_Cnt = 1 THEN        
        p_sRTSD0420SendMsg1(v_Send_Day, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        
        IF v_Success_Code < 0 THEN
            v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText || v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
        p_sRTSD0420SendMsg2(v_Send_Cnt, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        
        IF v_Success_Code < 0 THEN
            v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText || v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

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
        
  END p_sRTSD0420SendMsg;
  
  /*****************************************************************************
  -- 도착알림문자내역 최초 집계 문자 발송
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420SendMsg1 (
      v_Send_Day       IN RTSD0420.SEND_DAY%TYPE                 /*시작일             */
    , v_Reg_Id         IN VARCHAR2
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    Cursor Cur_Rtsd0420 IS
    SELECT 
        SEND_DAY
      , INVOICE_NO
      , LOGISTICS
      , SEND_CNT
      , SEND_CNT + 1 AS NEXT_SEND_CNT
      , GI_DAY
      , GI_YN
      , A.ORD_NO
      , ORDER_TYPE
      , MOB_NO
      , SMS_TYPE
      , DELIVERY_TYPE
      , DEL_YN
      , HOLD_YN
      FROM RTSD0420 A
      ,    RTSD0104 B
      WHERE 1=1
        AND A.ORD_NO = B.ORD_NO
        AND B.STAT_CD = '01'
        AND A.ORDER_TYPE = 'A'
        AND SEND_DAY = v_Send_Day
        AND SEND_CNT = 0    -- 최초발송대상만 포함
        AND GI_YN = 'Y'     -- 도착완료 확인된 대상만 포함
        AND DEL_YN = 'N'    -- 삭제처리된 대상은 제외
        AND HOLD_YN = 'N'
      UNION ALL
      SELECT 
        SEND_DAY
      , INVOICE_NO
      , LOGISTICS
      , SEND_CNT
      , SEND_CNT + 1 AS NEXT_SEND_CNT
      , GI_DAY
      , GI_YN
      , A.ORD_NO
      , ORDER_TYPE
      , MOB_NO
      , SMS_TYPE
      , DELIVERY_TYPE
      , DEL_YN
      , HOLD_YN
      FROM RTSD0420 A
      ,    (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY ORD_NO, DLVR_DAY DESC) NUM, ORD_NO FROM RTCS0010 WHERE DLV_STAT IN ('02', '03')) B
      WHERE 1=1
        AND A.ORD_NO = B.ORD_NO
        AND SEND_DAY = v_Send_Day
        AND B.NUM = 1
        AND A.ORDER_TYPE = 'B'
        AND SEND_CNT = 0    -- 최초발송대상만 포함
        AND GI_YN = 'Y'     -- 도착완료 확인된 대상만 포함
        AND DEL_YN = 'N'    -- 삭제처리된 대상은 제외
        AND HOLD_YN = 'N';  -- 발송중지대상은 제외
      
    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*데이타 존재여부       */
    
    v_Cmp_Msg_Id RTSD0205.CMP_MSG_ID%TYPE;             /*발송번호             */
    v_Snd_Msg RTSD0205.SND_MSG%TYPE;                   /*발송문구             */   
    
  BEGIN
  
    FOR CUR IN Cur_Rtsd0420 LOOP
        EXIT WHEN Cur_Rtsd0420%NOTFOUND;
        
        IF 0 != Pkg_Rtsd0420.f_UpdateRtsd0420(CUR.SEND_DAY, CUR.ORD_NO, CUR.ORDER_TYPE, CUR.INVOICE_NO, CUR.LOGISTICS, CUR.NEXT_SEND_CNT, CUR.GI_DAY
                                                , CUR.GI_YN, CUR.MOB_NO, CUR.SMS_TYPE, CUR.DELIVERY_TYPE, CUR.DEL_YN, CUR.HOLD_YN, v_Reg_Id, '', v_ErrorText) THEN
            v_Return_Message := 'RTSD0420 업데이트 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
                
              
        v_Snd_Msg := Pkg_Rtsd0420.f_MakeSendMsg(CUR.ORD_NO, CUR.SMS_TYPE, v_ErrorText);
            
        --완료 SMS 발송
        Pkg_Rtsd0205.p_Rtsd0205InterfaceNew1 (
              'I'                                   /*예약 전송여부    */
            , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
            , CUR.MOB_NO                      /*받는 전화번호    */
            , '18550100'                            /*보내는 전화번호  */
            , v_Snd_Msg                           /*메시지내용       */
            , ''                                    /*사용자지정 필드1 */
            , CUR.ORD_NO                              /*사용자지정 필드2 */
            ,'7'
            ,''
            , v_Reg_Id                              /*등록자 ID        */
            , v_Cmp_Msg_Id                          /*발송번호         */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
        
        IF v_Success_Code < 0 THEN
            v_Return_Message := 'SMS 등록 실패!!!'||'-'||v_ErrorText || v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
        --발송내역 저장
        Pkg_Rtsd0421.p_IUDRtsd0421('I', CUR.ORD_NO, CUR.ORDER_TYPE, CUR.NEXT_SEND_CNT, v_Cmp_Msg_Id,
                                          v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        
        IF v_Success_Code < 0 THEN
            v_Return_Message := 'RTSD0421 등록 실패!!!'||'-'||v_ErrorText || v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    END LOOP;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

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
        
  END p_sRTSD0420SendMsg1; 
  
  /*****************************************************************************
  -- 도착알림문자내역 추가집계 발송
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420SendMsg2 (
      v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE
    , v_Reg_Id          IN VARCHAR2                 /*등록자             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    -- 매 7일마다 발송 7번 발송 + 장착독려 + 회수알림
    CURSOR Cur_Rtsd0420 IS
    SELECT  A.SEND_DAY
          , A.ORD_NO
          , 'A' AS ORDER_TYPE
          , A.INVOICE_NO
          , A.LOGISTICS
          , SEND_CNT
          , A.SEND_CNT + 1 AS NEXT_SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , DECODE(v_Send_Cnt, 2, '01', 3, '01', 4, '01', 5, '01', 6, '02', 7, '02', 8, '03', 9, '04') AS SMS_TYPE
          , DELIVERY_TYPE
          , DEL_YN
          , HOLD_YN
      FROM  RTSD0420 A
          , (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEND_CNT DESC) NUM, ORD_NO, TO_CHAR(REG_DT + 7, 'YYYYMMDD') NEXT_SEND_DAY FROM RTSD0421) B
          , RTSD0104 C
     WHERE  1=1
       AND  A.ORD_NO = B.ORD_NO
       AND  B.ORD_NO = C.ORD_NO
       AND  A.SEND_CNT = v_Send_Cnt - 1
       AND  A.SEND_CNT BETWEEN 1 AND 9  -- 추가로 총 9번까지만 발송
       AND  NUM = 1
       AND  A.ORDER_TYPE = 'A' --걱정제로는 제외
       AND  A.GI_YN = 'Y'   -- 도착완료 확인된 대상만 포함
       AND  A.DEL_YN = 'N'  -- 삭제처리된 대상은 제외
       AND  A.HOLD_YN = 'N' -- 발송중지대상은 제외
       AND  NEXT_SEND_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD') 
       AND  C.STAT_CD IN ('01')
    ; 
    
    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*데이타 존재여부       */
    
    v_Cmp_Msg_Id RTSD0205.CMP_MSG_ID%TYPE;             /*발송번호             */     
    v_Snd_Msg RTSD0205.SND_MSG%TYPE;                   /*발송문구             */   
  BEGIN

    
    FOR CUR IN Cur_Rtsd0420 LOOP
        EXIT WHEN Cur_Rtsd0420%NOTFOUND;
        
        IF 0 < f_sRtsd0420Count(CUR.ORD_NO, CUR.ORDER_TYPE) THEN
            
            IF 0 != Pkg_Rtsd0420.f_UpdateRtsd0420(CUR.SEND_DAY, CUR.ORD_NO, CUR.ORDER_TYPE, CUR.INVOICE_NO, CUR.LOGISTICS, CUR.NEXT_SEND_CNT, CUR.GI_DAY
                                                , CUR.GI_YN, CUR.MOB_NO, CUR.SMS_TYPE, CUR.DELIVERY_TYPE, CUR.DEL_YN, CUR.HOLD_YN, v_Reg_Id, '', v_ErrorText) THEN
                v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
            
            v_Snd_Msg := Pkg_Rtsd0420.f_MakeSendMsg(CUR.ORD_NO, CUR.SMS_TYPE, v_ErrorText);

            
            --완료 SMS 발송
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew1 (
                  'I'                                   /*예약 전송여부    */
                , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                , CUR.MOB_NO                      /*받는 전화번호    */
                , '18550100'                            /*보내는 전화번호  */
                , v_Snd_Msg                           /*메시지내용       */
                , ''                                    /*사용자지정 필드1 */
                , CUR.ORD_NO                              /*사용자지정 필드2 */
                ,'7'
                ,''
                , v_Reg_Id                              /*등록자 ID        */
                , v_Cmp_Msg_Id                          /*발송번호         */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
            
            dbms_output.put_line(v_Return_Message || 'SMS 등록 실패!!!'||'-'||v_ErrorText);
            
            IF v_Success_Code < 0 THEN
                v_Return_Message := 'SMS 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
            
            -- 발송내역 저장
            Pkg_Rtsd0421.p_IUDRtsd0421('I', CUR.ORD_NO, CUR.ORDER_TYPE, CUR.NEXT_SEND_CNT, v_Cmp_Msg_Id,
                                              v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
            
            IF v_Success_Code < 0 THEN
                v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
            
        END IF;
        
    END LOOP;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

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

  END p_sRTSD0420SendMsg2; 
      
  /*****************************************************************************
  -- 도착알림문자내역(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0420 (
      v_Comm_Dvsn      IN CHAR                        /*처리구분(I,U,D)       */
    , v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*발송일자             */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_logistics       IN RTSD0420.LOGISTICS%TYPE              /*택배사             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*발송유형            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제여부            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*발송중지여부            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                  /*등록자 ID             */
    , v_Logistics_Status  IN RTSD0420.LOGISTICS_STATUS%TYPE     /*택배배송상태             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS 
  e_Error EXCEPTION;
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

        IF 0 != f_InsertRtsd0420(
              v_Send_Day
            , v_Ord_No   
            , v_Order_Type 
            , v_Invoice_No
            , v_logistics
            , v_Send_Cnt   
            , v_Gi_Day  
            , v_Gi_Yn   
            , v_Mob_No    
            , v_Sms_Type
            , v_Delivery_Type
            , v_Del_Yn
            , v_Hold_Yn
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn IN ('U') THEN
            
        IF 0 != f_UpdateRtsd0420(
              v_Send_Day
            , v_Ord_No  
            , v_Order_Type   
            , v_Invoice_No
            , v_logistics
            , v_Send_Cnt   
            , v_Gi_Day  
            , v_Gi_Yn   
            , v_Mob_No    
            , v_Sms_Type
            , v_Delivery_Type
            , v_Del_Yn
            , v_Hold_Yn
            , v_Reg_Id
            , v_Logistics_Status
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn IN ('D') THEN
    
        IF 0 != f_UpdateRtsd0420(
              v_Send_Day
            , v_Ord_No  
            , v_Order_Type   
            , v_Invoice_No
            , v_logistics
            , v_Send_Cnt   
            , v_Gi_Day  
            , v_Gi_Yn   
            , v_Mob_No    
            , v_Sms_Type
            , v_Delivery_Type
            , 'Y'
            , v_Hold_Yn
            , v_Reg_Id
            , v_Logistics_Status
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 수정 실패!!!'||'-'||v_ErrorText;
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

  END p_IUDRtsd0420;
   
  /*****************************************************************************
  -- 도착알림문자내역 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0420 (
      v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*발송일자             */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_logistics       IN RTSD0420.LOGISTICS%TYPE              /*택배사             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*발송유형            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제여부            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*발송중지여부            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                  /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0420 (
          SEND_DAY
        , ORD_NO
        , ORDER_TYPE
        , INVOICE_NO
        , LOGISTICS
        , SEND_CNT
        , GI_DAY
        , GI_YN
        , MOB_NO
        , SMS_TYPE
        , DELIVERY_TYPE
        , DEL_YN
        , HOLD_YN
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Send_Day
        , v_Ord_No 
        , v_Order_Type   
        , v_Invoice_No
        , v_logistics
        , v_Send_Cnt   
        , v_Gi_Day  
        , v_Gi_Yn   
        , v_Mob_No    
        , v_Sms_Type
        , v_Delivery_Type
        , v_Del_Yn
        , DECODE(v_Hold_Yn, '1', 'Y', 'N')
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

  END f_InsertRtsd0420;
  
  /*****************************************************************************
  -- 도착알림문자내역 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-30  kstka            [20210830_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0420 (
      v_Send_Day        IN RTSD0420.SEND_DAY%TYPE               /*집계일자             */
    , v_Ord_No          IN RTSD0420.ORD_NO%TYPE                 /*주문번호             */
    , v_Order_Type      IN RTSD0420.ORDER_TYPE%TYPE             /*주문유형             */
    , v_Invoice_No      IN RTSD0420.INVOICE_NO%TYPE             /*송장번호             */
    , v_logistics       IN RTSD0420.LOGISTICS%TYPE              /*택배사             */
    , v_Send_Cnt        IN RTSD0420.SEND_CNT%TYPE               /*발송횟수            */
    , v_Gi_Day          IN RTSD0420.GI_DAY%TYPE                 /*출고일자            */
    , v_Gi_Yn           IN RTSD0420.GI_YN%TYPE                  /*출고확인            */
    , v_Mob_No          IN RTSD0420.MOB_NO%TYPE                 /*휴대폰번호            */
    , v_Sms_Type        IN RTSD0420.SMS_TYPE%TYPE               /*문자유형            */
    , v_Delivery_Type   IN RTSD0420.DELIVERY_TYPE%TYPE          /*발송유형            */
    , v_Del_Yn          IN RTSD0420.DEL_YN%TYPE                 /*삭제여부            */
    , v_Hold_Yn         IN RTSD0420.HOLD_YN%TYPE                /*발송중지여부            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                 /*등록자 ID             */
    , v_Logistics_Status  IN RTSD0420.LOGISTICS_STATUS%TYPE     /*택배배송상태             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS 
  BEGIN

    UPDATE RTSD0420
       SET SEND_CNT    = v_Send_Cnt
         , GI_YN       = v_Gi_Yn
         , SMS_TYPE    = v_Sms_Type
         , DELIVERY_TYPE = v_Delivery_Type
         , INVOICE_NO  = v_Invoice_No
         , LOGISTICS   = v_logistics
         , DEL_YN      = v_Del_Yn
         , HOLD_YN     = DECODE(v_Hold_Yn, '1', 'Y', 'N')
         , CHG_ID      = v_Reg_Id
         , CHG_DT      = SYSDATE
         , LOGISTICS_STATUS = v_Logistics_Status  
    WHERE  ORD_NO      = v_Ord_No
      AND  ORDER_TYPE  = v_Order_Type
      AND  SEND_DAY    = v_Send_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0420;
  
  /*****************************************************************************
  -- 도착알림문구 생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-13  kstka            [20210913_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_MakeSendMsg (
      v_Ord_No            IN RTSD0420.ORD_NO%TYPE,              /*주문번호             */
      v_Sms_Type          IN RTSD0422.SMS_TYPE%TYPE             /*문자유형             */
    , v_ErrorText        OUT VARCHAR2
  ) RETURN VARCHAR IS
  
  v_Cust_Nm RTSD0100.CUST_NM%TYPE;
  v_Mat_Nm  RTSD0005.MAT_NM%TYPE;
  v_Cnt_Cd  RTSD0104.CNT_CD%TYPE;
  v_Car_No  RTSD0104.CAR_NO%TYPE;
  v_Agency_Nm RTSD0007.AGENCY_NM%TYPE;
  v_Agency_Addr VARCHAR2(200);
  v_Agency_Tel  VARCHAR2(20);
  v_MM VARCHAR2(2);
  v_DD VARCHAR2(2);
  
  v_Sms_Msg RTSD0422.SMS_MSG%TYPE;
  BEGIN

    IF v_Sms_Type = '11' THEN
    
        SELECT D.MAT_NM
         , A.KWMENG AS CNT_CD
         , E.CAR_NO
         , B.AGENCY_NM
         , A.ADDR1 AS AGENCY_ADDR
         , A.DLV_TEL AS AGENCY_TEL
         , C.CUST_NM 
        INTO v_Mat_Nm
            , v_Cnt_Cd
            , v_Car_No
            , v_Agency_Nm
            , v_Agency_Addr
            , v_Agency_Tel
            , v_Cust_Nm 
        FROM RTCS0010 A
           , RTSD0007 B
           , RTSD0100 C
           , RTSD0005 D
           , RTSD0104 E
        WHERE 1=1
        AND A.AGENCY_CD = B.AGENCY_CD
        AND A.CUST_NO = C.CUST_NO
        AND A.MATNR = D.MAT_CD
        AND A.ORD_NO = E.ORD_NO
        AND A.DLV_STAT IN ('02', '03')
        AND A.ORD_NO = v_Ord_No;
        
    ELSE 
    
        SELECT E.MAT_NM
         , A.CNT_CD
         , A.CAR_NO
         , C.AGENCY_NM
         , C.POS_CD || ' ' || C.CITY || ' ' || C.STREET AS AGENCY_ADDR
         , C.TEL_NO AS AGENCY_TEL
         , D.CUST_NM
         INTO v_Mat_Nm
            , v_Cnt_Cd
            , v_Car_No
            , v_Agency_Nm
            , v_Agency_Addr
            , v_Agency_Tel
            , v_Cust_Nm 
        FROM RTSD0104 A
           , RTSD0106 B
           , RTSD0007 C
           , RTSD0100 D
           , RTSD0005 E
        WHERE 1=1
        AND A.ORD_NO = B.ORD_NO
        AND A.AGENCY_CD = C.AGENCY_CD
        AND A.CUST_NO = D.CUST_NO
        AND B.MAT_CD = E.MAT_CD
        AND A.ORD_NO = v_Ord_No;
    
    END IF;
    
    SELECT SMS_MSG
    INTO v_Sms_Msg 
    FROM RTSD0422 
    WHERE SMS_TYPE = v_Sms_Type
    AND USE_YN = 'Y';
    
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@CUST_NM@', v_Cust_Nm);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@ORD_NO@', v_Ord_No);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@MAT_NM@', v_Mat_Nm);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@CNT_CD@', v_Cnt_Cd);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@CAR_NO@', v_Car_No);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@AGENCY_NM@', v_Agency_Nm);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@AGENCY_ADDR@', v_Agency_Addr);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@AGENCY_TEL@', v_Agency_Tel);
    
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@MM@', v_MM);
    v_Sms_Msg := REPLACE(v_Sms_Msg, '@DD@', v_DD);
    
    RETURN v_Sms_Msg;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN '';

  END f_MakeSendMsg;
  
  /*****************************************************************************
  -- 도착알림문자내역 집계내역 갱신
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-10-21  kstka            [20211021_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420Renew (
      v_Day_F           IN VARCHAR2                 /*시작일             */
    , v_Day_T           IN VARCHAR2                 /*종료일             */
    , v_Reg_Id          IN VARCHAR2                 /*등록자             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    CURSOR Cur_Rtsd0420 IS
      SELECT
            A.SEND_DAY
          , A.ORD_NO
          , A.CUST_NO
          , A.CUST_NM
          , A.ORDER_TYPE
          , NVL(TRIM(A.INVOICE_NO), C.ZParcelInvoice) AS INVOICE_NO
          , NVL(TRIM(A.LOGISTICS), C.Zcompany) AS LOGISTICS
          , A.SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , A.SMS_TYPE
          , A.DELIVERY_TYPE
          , A.DEL_YN
          , A.HOLD_YN
          , A.REG_ID
          , A.REG_DT
          , v_Reg_Id
          , SYSDATE      
      FROM  RTSD0420 A
          , RTSD0104 B
          , RTSD0115 C
          , RTSD0116 D
          , RTSD0100 E
     WHERE  1=1
       AND  A.ORD_NO = B.ORD_NO
       AND  B.ORD_NO = C.ORD_NO
       AND  C.ORD_NO = D.ORD_NO
       AND  C.VBELN = D.VBELN
       AND  C.TRANS_TP = 'N'
       AND  B.STAT_CD IN ('01')
       AND  B.CHAN_CD IN ('02', '03', '04')
       AND  B.CUST_NO = E.CUST_NO
       AND  A.SEND_CNT = 0
       AND  A.SEND_DAY BETWEEN v_Day_F AND v_Day_T
    UNION ALL   --걱정제로 포함
    SELECT  
            A.SEND_DAY
          , A.ORD_NO
          , A.CUST_NO
          , A.CUST_NM
          , A.ORDER_TYPE
          , NVL(TRIM(A.INVOICE_NO), C.ZParcelInvoice) AS INVOICE_NO
          , NVL(TRIM(A.LOGISTICS), C.Zcompany) AS LOGISTICS
          , A.SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , A.SMS_TYPE
          , A.DELIVERY_TYPE
          , A.DEL_YN
          , A.HOLD_YN
          , A.REG_ID
          , A.REG_DT
          , v_Reg_Id
          , SYSDATE
      FROM RTSD0420 A
        ,  (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY DLVR_DAY, DLVR_SEQ) NUM, ORD_NO, CUST_NO, DLV_STAT, DLVR_DAY FROM RTCS0010 WHERE DLV_STAT NOT IN ('06')) B
        ,  RTSD0115 C
        ,  RTSD0116 D
        ,  RTSD0100 E
      WHERE 1=1
        AND  A.ORD_NO = B.ORD_NO
        AND  B.ORD_NO = C.ORD_NO
        AND  TO_CHAR(B.NUM)    = TO_CHAR(C.NUM)
        AND  C.ORD_NO = D.ORD_NO
        AND  C.VBELN = D.VBELN
        AND  C.NUM = D.NUM
        AND  C.TRANS_TP LIKE 'S%'
        AND  B.DLV_STAT IN ('02', '03')
        AND  B.CUST_NO = E.CUST_NO
        AND  A.SEND_CNT = 0
        AND  A.SEND_DAY BETWEEN v_Day_F AND v_Day_T
    ;
    
    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*데이타 존재여부       */

  BEGIN

       FOR CUR IN Cur_Rtsd0420 LOOP
       
            IF 0 != Pkg_Rtsd0420.f_UpdateRtsd0420(CUR.SEND_DAY, CUR.ORD_NO, CUR.ORDER_TYPE, CUR.INVOICE_NO, CUR.LOGISTICS, CUR.SEND_CNT, CUR.GI_DAY
                                                , CUR.GI_YN, CUR.MOB_NO, CUR.SMS_TYPE, CUR.DELIVERY_TYPE, CUR.DEL_YN, CUR.HOLD_YN, v_Reg_Id, '', v_ErrorText) THEN
                v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
            
       END LOOP;
   
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

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
        
  END p_sRTSD0420Renew; 
  
  /*****************************************************************************
  -- 도착알림문자내역 Select (택배건만)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-01  kstka            [20220701_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0420ByPost (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Day_F           IN RTSD0420.SEND_DAY%TYPE               /*발송일자            */
    , v_Day_T           IN RTSD0420.SEND_DAY%TYPE               /*발송일자            */
    , v_Reg_Id          IN RTSD0420.REG_ID%TYPE                 /*등록자              */ 
  ) IS 

  BEGIN

    OPEN Ref_Cursor FOR
      SELECT
            A.SEND_DAY
          , A.ORD_NO
          , A.CUST_NO
          , A.CUST_NM
          , A.ORDER_TYPE
          , NVL(TRIM(A.INVOICE_NO), C.ZParcelInvoice) AS INVOICE_NO
          , NVL(TRIM(A.LOGISTICS), C.Zcompany) AS LOGISTICS_NM
          , Pkg_Rtsd0423.f_sRtsd0423Code(NVL(TRIM(A.LOGISTICS), C.Zcompany)) AS LOGISTICS_CD
          , A.SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , A.SMS_TYPE
          , A.DELIVERY_TYPE
          , A.DEL_YN
          , A.HOLD_YN
          , A.REG_ID
          , A.REG_DT
          , v_Reg_Id
          , SYSDATE      
      FROM  RTSD0420 A
          , RTSD0104 B
          , RTSD0115 C
          , RTSD0116 D
          , RTSD0100 E
     WHERE  1=1
       AND  A.ORD_NO = B.ORD_NO
       AND  B.ORD_NO = C.ORD_NO
       AND  C.ORD_NO = D.ORD_NO
       AND  C.VBELN = D.VBELN
       AND  C.TRANS_TP = 'N'
       AND  B.STAT_CD IN ('01')
       AND  B.CHAN_CD IN ('02', '03', '04')
       AND  B.CUST_NO = E.CUST_NO
       AND  A.DELIVERY_TYPE = '02'  --택배건만
       AND  A.SEND_DAY BETWEEN v_Day_F AND v_Day_T
    UNION ALL   --걱정제로 포함
    SELECT  
            A.SEND_DAY
          , A.ORD_NO
          , A.CUST_NO
          , A.CUST_NM
          , A.ORDER_TYPE
          , NVL(TRIM(A.INVOICE_NO), C.ZParcelInvoice) AS INVOICE_NO
          , NVL(TRIM(A.LOGISTICS), C.Zcompany) AS LOGISTICS_NM
          , Pkg_Rtsd0423.f_sRtsd0423Code(NVL(TRIM(A.LOGISTICS), C.Zcompany)) AS LOGISTICS_CD
          , A.SEND_CNT
          , A.GI_DAY
          , A.GI_YN
          , A.MOB_NO
          , A.SMS_TYPE
          , A.DELIVERY_TYPE
          , A.DEL_YN
          , A.HOLD_YN
          , A.REG_ID
          , A.REG_DT
          , v_Reg_Id
          , SYSDATE
      FROM RTSD0420 A
        ,  (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY DLVR_DAY, DLVR_SEQ) NUM, ORD_NO, CUST_NO, DLV_STAT, DLVR_DAY FROM RTCS0010 WHERE DLV_STAT NOT IN ('06')) B
        ,  RTSD0115 C
        ,  RTSD0116 D
        ,  RTSD0100 E
      WHERE 1=1
        AND  A.ORD_NO = B.ORD_NO
        AND  B.ORD_NO = C.ORD_NO
        AND  TO_CHAR(B.NUM)    = TO_CHAR(C.NUM)
        AND  C.ORD_NO = D.ORD_NO
        AND  C.VBELN = D.VBELN
        AND  C.NUM = D.NUM
        AND  C.TRANS_TP LIKE 'S%'
        AND  B.DLV_STAT IN ('02', '03')
        AND  B.CUST_NO = E.CUST_NO
        AND  A.DELIVERY_TYPE = '02' --택배건만
        AND  A.SEND_DAY BETWEEN v_Day_F AND v_Day_T
    ;

  END p_sRTSD0420ByPost; 
  
END Pkg_Rtsd0420;