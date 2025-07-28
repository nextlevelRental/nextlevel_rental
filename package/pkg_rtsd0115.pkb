CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0115 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0115
   PURPOSE   SAL SO LOG 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-18  jemcarry         1. Created this package body.
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
*******************************************************************************/

  /*****************************************************************************
  -- SAL SO LOG Count
  *****************************************************************************/
  FUNCTION f_sRtsd0115Count(
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,           /*계약번호            */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,         /*전송구분            */
    v_Zad_Order      IN VARCHAR                         /*마모파손서비스여부      */ --[20201202_01]
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
    
    v_Gubun VARCHAR2(1);
  BEGIN
   IF SUBSTR(v_Ord_No,14,1) IS NOT NULL THEN   
   
     --마모파손보증서비스
    IF v_Zad_Order = 'X' THEN
        v_Gubun := 'W';
    ELSE
        v_Gubun := 'S';
    END IF;
    
     SELECT  COUNT(*)
      INTO    v_curr_cunt
      FROM    RTSD0115
      WHERE   ORD_NO   = SUBSTR(v_Ord_No,1,12)
      AND     TRANS_TP = v_Gubun ||SUBSTR(v_Ord_No,14,1)
      AND     NUM      = SUBSTR(v_Ord_No,14,1);    -- 조건절 및 주분번호 관련 변경 
   ELSE
     SELECT  COUNT(*)
      INTO    v_curr_cunt
      FROM    RTSD0115
      WHERE   ORD_NO   = SUBSTR(v_Ord_No,1,12)
      AND     TRANS_TP = v_Trans_Tp
      AND     NUM      IS NULL;    -- 조건절 및 주분번호 관련 변경    
   END IF;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0115Count;

  /*****************************************************************************
  -- SAL SO LOG Select
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0115 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_FDay      IN RTSD0115.SEND_DAY%TYPE,       /*송신일자FROM          */
    v_Send_TDay      IN RTSD0115.SEND_DAY%TYPE,       /*송신일자TO            */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.TRANS_TP,                  /*전송구분            */
            A.SEND_DAY,                  /*송신일자            */
            A.TRANS_DAY,                 /*수신일자            */
            A.EAI_YN,                    /*EAI 수신여부        */
            A.SAP_YN,                    /*SAP 결과수신여부    */
            A.VBELN,                     /*SAP 주문번호        */
            A.REQ_TEXT,                  /*비고                */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            A.VBELN_D,                   /*SAP 배송번호        */
            A.MATNR_O,                   /*출고예정 상품코드   */
            A.MATNR_S,                   /*실제출고 상품코드   */
            A.BEZEI                      /*택배여부            */
    FROM    RTSD0115 A
    WHERE   A.SEND_DAY BETWEEN v_Send_FDay AND v_Send_TDay
    AND     A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.TRANS_TP  = DECODE(v_Trans_Tp  , NULL, A.TRANS_TP  , v_Trans_Tp)
    AND     A.TRANS_DAY = DECODE(v_Trans_Day , NULL, A.TRANS_DAY , v_Trans_Day)
    AND     A.EAI_YN    = DECODE(v_Eai_Yn    , NULL, A.EAI_YN    , v_Eai_Yn)
    AND     A.SAP_YN    = DECODE(v_Sap_Yn    , NULL, A.SAP_YN    , v_Sap_Yn)
    AND     A.VBELN     = DECODE(v_Vbeln     , NULL, A.VBELN     , v_Vbeln)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtsd0115;

  /*****************************************************************************
  -- SAL SO LOG Insert
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  FUNCTION f_InsertRtsd0115 (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_Day       IN RTSD0115.SEND_DAY%TYPE,       /*송신일자              */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Req_Text       IN RTSD0115.REQ_TEXT%TYPE,       /*비고                  */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR,                      /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사               */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
        v_Gubun VARCHAR2(1);
  BEGIN
  
    -- 2016.02. 16 걱정제로 관련해서회수 추가 해주기 위해서 NUM 추가
    IF SUBSTR(v_Ord_No,14,1) IS NOT NULL THEN

    --마모파손보증서비스
    IF v_Zad_Order = 'X' THEN
        v_Gubun := 'W';
    ELSE
        v_Gubun := 'S';
    END IF;
    
    INSERT  INTO RTSD0115 (
              ORD_NO,
              TRANS_TP,
              SEND_DAY,
              TRANS_DAY,
              EAI_YN,
              SAP_YN,
              VBELN,
              REQ_TEXT,
              NUM,     
              REG_ID,
              REG_DT,
              CHG_ID,
              CHG_DT,
              VBELN_D,
              MATNR_O,
              MATNR_S,
              BEZEI,
              ZCOMPANY,
              ZPARCELINVOICE
              )
      VALUES  (
              SUBSTR(v_Ord_No,1,12),
              v_Gubun || SUBSTR(v_Ord_No,14,1),
              v_Send_Day,
              v_Trans_Day,
              v_Eai_Yn,
              v_Sap_Yn,
              v_Vbeln,
              v_Req_Text,
              SUBSTR(v_Ord_No,14,1),
              v_Reg_Id,
              SYSDATE,
              v_Reg_Id,
              SYSDATE,
              v_Vbeln_D,
              v_Matnr_O,
              v_Matnr_S,
              v_Bezei,
              v_Zcompany,
              v_ZParcelInvoice
              );
   ELSE        
    INSERT  INTO RTSD0115 (
              ORD_NO,
              TRANS_TP,
              SEND_DAY,
              TRANS_DAY,
              EAI_YN,
              SAP_YN,
              VBELN,
              REQ_TEXT,
            --  NUM,     
              REG_ID,
              REG_DT,
              CHG_ID,
              CHG_DT,
              VBELN_D,
              MATNR_O,
              MATNR_S,
              BEZEI,
              ZCOMPANY,
              ZPARCELINVOICE
              )
      VALUES  (
              SUBSTR(v_Ord_No,1,12),
              v_Trans_Tp,
              v_Send_Day,
              v_Trans_Day,
              v_Eai_Yn,
              v_Sap_Yn,
              v_Vbeln,
              v_Req_Text,
             -- SUBSTR(v_Ord_No,14,1),
              v_Reg_Id,
              SYSDATE,
              v_Reg_Id,
              SYSDATE,
              v_Vbeln_D,
              v_Matnr_O,
              v_Matnr_S,
              v_Bezei,
              v_Zcompany,
              v_ZParcelInvoice
              );   
    END IF;       

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0115;

  /*****************************************************************************
  -- SAL SO LOG Update
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0115 (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_Day       IN RTSD0115.SEND_DAY%TYPE,       /*송신일자              */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Req_Text       IN RTSD0115.REQ_TEXT%TYPE,       /*비고                  */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR,                      /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사               */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
    v_Gubun VARCHAR2(1);
  BEGIN
  
    --2016 02 16 걱정제로추로 관련 NUM 비교 하고자 추가
    IF SUBSTR(v_Ord_No,14,1) IS NOT NULL THEN
    
    --마모파손보증서비스
    IF v_Zad_Order = 'X' THEN
        v_Gubun := 'W';
    ELSE
        v_Gubun := 'S';
    END IF;
    
    UPDATE RTSD0115
        SET    SEND_DAY  = DECODE(v_Send_Day, NULL, SEND_DAY, v_Send_Day),
               TRANS_DAY = v_Trans_Day,
               EAI_YN    = DECODE(v_Eai_Yn, NULL, EAI_YN, v_Eai_Yn),
               SAP_YN    = v_Sap_Yn,
               VBELN     = v_Vbeln,
               REQ_TEXT  = v_Req_Text,
               CHG_ID    = v_Reg_Id,
               NUM       = SUBSTR(v_Ord_No,14,1),
               CHG_DT    = SYSDATE, 
               VBELN_D   = v_Vbeln_D,
               MATNR_O   = v_Matnr_O,
               MATNR_S   = v_Matnr_S, 
               BEZEI     = v_Bezei,
               ZCOMPANY  = v_Zcompany,
               ZPARCELINVOICE = v_ZParcelInvoice
        WHERE  ORD_NO    = SUBSTR(v_Ord_No,1,12)
        AND    TRANS_TP  = v_Gubun ||SUBSTR(v_Ord_No,14,1)
        AND    NUM       = SUBSTR(v_Ord_No,14,1);
         
    ELSE 
    
    UPDATE RTSD0115
        SET    SEND_DAY  = DECODE(v_Send_Day, NULL, SEND_DAY, v_Send_Day),
               TRANS_DAY = v_Trans_Day,
               EAI_YN    = DECODE(v_Eai_Yn, NULL, EAI_YN, v_Eai_Yn),
               SAP_YN    = v_Sap_Yn,
               VBELN     = v_Vbeln,
               REQ_TEXT  = v_Req_Text,
               CHG_ID    = v_Reg_Id,
              -- NUM       = SUBSTR(v_Ord_No,14,1),
               CHG_DT    = SYSDATE,
               VBELN_D   = v_Vbeln_D,
               MATNR_O   = v_Matnr_O,
               MATNR_S   = v_Matnr_S, 
               BEZEI     = v_Bezei,
               ZCOMPANY  = v_Zcompany,
               ZPARCELINVOICE = v_ZParcelInvoice
        WHERE  ORD_NO    = SUBSTR(v_Ord_No,1,12)
        AND    TRANS_TP  = v_Trans_Tp
        AND    NUM      IS NULL ;
    END IF;



    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0115;

  /*****************************************************************************
  -- SAL SO LOG 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-09-20  wjim             [20180920_01] 배송번호, 출고예정상품, 실제출고상품, 택배여부 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0115 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Send_Day       IN RTSD0115.SEND_DAY%TYPE,       /*송신일자              */
    v_Trans_Day      IN RTSD0115.TRANS_DAY%TYPE,      /*수신일자              */
    v_Eai_Yn         IN RTSD0115.EAI_YN%TYPE,         /*EAI 수신여부          */
    v_Sap_Yn         IN RTSD0115.SAP_YN%TYPE,         /*SAP 결과수신여부      */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Req_Text       IN RTSD0115.REQ_TEXT%TYPE,       /*비고                  */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR,                      /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사               */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호, 전송구분, 등록자 ID    
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Trans_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S065', v_Trans_Tp)) THEN
        v_Return_Message := '전송구분('||v_Trans_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF (TRIM(v_Send_Day) IS NOT NULL) AND (0 != ISDATE(v_Send_Day)) THEN
        v_Return_Message := '송신일자('||v_Send_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Trans_Day) IS NOT NULL) AND (0 != ISDATE(v_Trans_Day)) THEN
        v_Return_Message := '수신일자('||v_Trans_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0115Count(v_Ord_No, v_Trans_Tp, v_Zad_Order) THEN

        IF 0 != f_InsertRtsd0115( v_Ord_No, v_Trans_Tp, v_Send_Day, v_Trans_Day,
                                  v_Eai_Yn, v_Sap_Yn, v_Vbeln, v_Req_Text,
                                  v_Reg_Id, TRIM(v_Vbeln_D), v_Matnr_O, v_Matnr_S, v_Bezei, v_Zad_Order, 
                                  v_Zcompany, v_ZParcelInvoice, v_ErrorText) THEN
            v_Return_Message := ' SAL SO LOG 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
    
        IF 0 != f_UpdateRtsd0115( v_Ord_No, v_Trans_Tp, v_Send_Day, v_Trans_Day,
                                  v_Eai_Yn, v_Sap_Yn, v_Vbeln, v_Req_Text, 
                                  v_Reg_Id, TRIM(v_Vbeln_D), v_Matnr_O, v_Matnr_S, v_Bezei, v_Zad_Order, 
                                  v_Zcompany, v_ZParcelInvoice, v_ErrorText) THEN
            v_Return_Message := ' SAL SO LOG 수정 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0115.p_IUDRtsd0115(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0115.p_IUDRtsd0115(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0115;

  /*****************************************************************************
  -- SAL SO LOG Update Return Order
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2023-09-18  kstka             [20230918_01] created
  *****************************************************************************/
  FUNCTION f_UpdateReturnOrderInfo (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Reg_Id         IN RTSD0115.REG_ID%TYPE,         /*등록자 ID             */
    v_Vbeln_R        IN RTSD0115.VBELN_R%TYPE,        /*SAP 취소오더번호       */
    v_Vbeln_D_R      IN RTSD0115.VBELN_D_R%TYPE,      /*SAP 취소오더배송번호    */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
  BEGIN
    
    UPDATE RTSD0115
        SET    
               CHG_ID    = v_Reg_Id,
               CHG_DT    = SYSDATE, 
               VBELN_R   = v_Vbeln_R,
               VBELN_D_R = v_Vbeln_D_R
        WHERE  ORD_NO    = v_Ord_No
        AND    TRANS_TP  = v_Trans_Tp
        ;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateReturnOrderInfo;
  
END Pkg_Rtsd0115;