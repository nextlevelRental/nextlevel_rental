CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0300 AS
/*******************************************************************************
   NAME      Pkg_Rtre0300
   PURPOSE   벤더 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2010-09-01  kstka             [20200901_01] 신규생성
*******************************************************************************/
  
  /*****************************************************************************
  -- 수수료 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0300 (
      slcm_ym           IN RTRE0300.SLCM_YM%TYPE  
    , lifnr             IN RTRE0300.LIFNR%TYPE                  /*벤더코드            */
    , comm_Tamt         IN RTRE0300.COMM_TAMT%TYPE              /*벤더명     */
    , comm_Namt         IN RTRE0300.COMM_NAMT%TYPE              /*전화번호            */
    , comm_Vamt         IN RTRE0300.COMM_VAMT%TYPE              /*휴대폰번호            */
    , slip_No           IN RTRE0300.SLIP_NO%TYPE                /*대리점코드            */
    , vndr_Nm           IN RTRE0300.VNDR_NM%TYPE                /*세금계산서발행방법            */
    , vndr_Mob_No       IN RTRE0300.VNDR_MOB_NO%TYPE            /*등록자ID            */
    , agency_Cd         IN RTRE0300.AGENCY_CD%TYPE              /*등록자ID            */
    , tax_Rqcd          IN RTRE0300.TAX_RQCD%TYPE               /*사용여부            */
    , rnt_Ofc           IN RTRE0300.RNT_OFC%TYPE                /*등록자ID            */
    , rnt_Pnt           IN RTRE0300.RNT_PNT%TYPE                /*등록자ID            */
    , rnt_Mst_Id        IN RTRE0300.RNT_MST_ID%TYPE             /*등록자ID            */
    , mst_Mob_No        IN RTRE0300.MST_MOB_NO%TYPE             /*등록자ID            */
    , mst_Email         IN RTRE0300.MST_EMAIL%TYPE              /*등록자ID            */
    , sms_Yn            IN RTRE0300.SMS_YN%TYPE                 /*등록자ID            */
    , sms_Dt            IN RTRE0300.SMS_DT%TYPE                 /*등록자ID            */
    , pi_Dstry_Yn       IN RTRE0300.PI_DSTRY_YN%TYPE            /*등록자ID            */
    , pi_Dstry_Id       IN RTRE0300.PI_DSTRY_ID%TYPE            /*등록자ID            */
    , pi_Dstry_Dt       IN RTRE0300.PI_DSTRY_DT%TYPE            /*등록자ID            */
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTRE0300 (
            SLCM_YM
         ,  LIFNR
         ,  COMM_TAMT
         ,  COMM_NAMT
         ,  COMM_VAMT
         ,  SLIP_NO
         ,  VNDR_NM
         ,  VNDR_MOB_NO
         ,  AGENCY_CD
         ,  TAX_RQCD
         ,  RNT_OFC
         ,  RNT_PNT
         ,  RNT_MST_ID
         ,  MST_MOB_NO
         ,  MST_EMAIL
         ,  SMS_YN
         ,  SMS_DT
         ,  PI_DSTRY_YN
         ,  PI_DSTRY_ID
         ,  PI_DSTRY_DT
         ,  REG_ID
         ,  REG_DT
         ,  CHG_ID
         ,  CHG_DT            
    ) VALUES (
          slcm_ym             
        , lifnr                                 /*벤더코드            */
        , comm_Tamt                             /*벤더명     */
        , comm_Namt                             /*전화번호            */
        , comm_Vamt                             /*휴대폰번호            */
        , slip_No                               /*대리점코드            */
        , vndr_Nm                               /*세금계산서발행방법            */
        , vndr_Mob_No                           /*등록자ID            */
        , agency_Cd                             /*등록자ID            */
        , tax_Rqcd                              /*사용여부            */
        , rnt_Ofc                               /*등록자ID            */
        , rnt_Pnt                               /*등록자ID            */
        , rnt_Mst_Id                            /*등록자ID            */
        , mst_Mob_No                            /*등록자ID            */
        , mst_Email                             /*등록자ID            */
        , sms_Yn                                /*등록자ID            */
        , sms_Dt                                /*등록자ID            */
        , pi_Dstry_Yn                           /*등록자ID            */
        , pi_Dstry_Id                           /*등록자ID            */
        , pi_Dstry_Dt                           /*등록자ID            */
        , reg_Id                                /*등록자ID            */
        , SYSDATE
        , reg_Id
        , SYSDATE  
    );
    
    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0300;
  
  /*****************************************************************************
  -- 수수료 정보 Update
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0300 (
      slcm_ym           IN RTRE0300.SLCM_YM%TYPE  
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    
  BEGIN

    MERGE  INTO RTRE0300 TGT
     USING  (
                SELECT  A1.SLCM_YM
                     ,  A1.LIFNR
                     ,  B1.VNDR_NM
                     ,  B1.MOB_NO     AS VNDR_MOB_NO
                     ,  B1.AGENCY_CD
                     ,  B1.TAX_RQCD
                     ,  B1.RNT_OFC
                     ,  B1.RNT_PNT
                     ,  C1.RNT_MST_ID
                     ,  D1.MOB_NO     AS MST_MOB_NO
                     ,  D1.EMAIL_ADDR AS MST_EMAIL
                  FROM  RTRE0300 A1
                     ,  RTRE0130 B1
                     ,  RTCM0110 C1
                     ,  RTCM0111 D1
                 WHERE  1=1
                   AND  A1.SLCM_YM    = slcm_ym    --*
                   AND  A1.LIFNR      = B1.LIFNR(+)
                   AND  B1.RNT_OFC    = C1.RNT_OFC(+)
                   AND  B1.RNT_PNT    = C1.RNT_PNT(+)
                   AND  C1.RNT_MST_ID = D1.RNT_MST_ID(+)
            ) SRC 
        ON  (TGT.SLCM_YM = SRC.SLCM_YM AND TGT.LIFNR = SRC.LIFNR)
      WHEN  MATCHED THEN
        UPDATE  
           SET  TGT.VNDR_NM     = SRC.VNDR_NM
             ,  TGT.VNDR_MOB_NO = SRC.VNDR_MOB_NO
             ,  TGT.AGENCY_CD   = SRC.AGENCY_CD
             ,  TGT.TAX_RQCD    = SRC.TAX_RQCD
             ,  TGT.RNT_OFC     = SRC.RNT_OFC
             ,  TGT.RNT_PNT     = SRC.RNT_PNT
             ,  TGT.RNT_MST_ID  = SRC.RNT_MST_ID
             ,  TGT.MST_MOB_NO  = SRC.MST_MOB_NO
             ,  TGT.MST_EMAIL   = SRC.MST_EMAIL
             ,  TGT.CHG_ID      = reg_Id   --*
             ,  TGT.CHG_DT      = SYSDATE
    ;

  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0300.p_UpdateRtre0300(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_Code   := -1;
        v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0300.p_UpdateRtre0300(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0300;
  
  /*****************************************************************************
  -- 수수료 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0300 (
      dvsn       IN CHAR                        /*처리구분(I,U,D)     */
    , slcm_ym           IN RTRE0300.SLCM_YM%TYPE  
    , lifnr             IN RTRE0300.LIFNR%TYPE                  /*벤더코드            */
    , comm_Tamt         IN RTRE0300.COMM_TAMT%TYPE              /*벤더명     */
    , comm_Namt         IN RTRE0300.COMM_NAMT%TYPE              /*전화번호            */
    , comm_Vamt         IN RTRE0300.COMM_VAMT%TYPE              /*휴대폰번호            */
    , slip_No           IN RTRE0300.SLIP_NO%TYPE                /*대리점코드            */
    , vndr_Nm           IN RTRE0300.VNDR_NM%TYPE                /*세금계산서발행방법            */
    , vndr_Mob_No       IN RTRE0300.VNDR_MOB_NO%TYPE            /*등록자ID            */
    , agency_Cd         IN RTRE0300.AGENCY_CD%TYPE              /*등록자ID            */
    , tax_Rqcd          IN RTRE0300.TAX_RQCD%TYPE               /*사용여부            */
    , rnt_Ofc           IN RTRE0300.RNT_OFC%TYPE                /*등록자ID            */
    , rnt_Pnt           IN RTRE0300.RNT_PNT%TYPE                /*등록자ID            */
    , rnt_Mst_Id        IN RTRE0300.RNT_MST_ID%TYPE             /*등록자ID            */
    , mst_Mob_No        IN RTRE0300.MST_MOB_NO%TYPE             /*등록자ID            */
    , mst_Email         IN RTRE0300.MST_EMAIL%TYPE              /*등록자ID            */
    , sms_Yn            IN RTRE0300.SMS_YN%TYPE                 /*등록자ID            */
    , sms_Dt            IN RTRE0300.SMS_DT%TYPE                 /*등록자ID            */
    , pi_Dstry_Yn       IN RTRE0300.PI_DSTRY_YN%TYPE            /*등록자ID            */
    , pi_Dstry_Id       IN RTRE0300.PI_DSTRY_ID%TYPE            /*등록자ID            */
    , pi_Dstry_Dt       IN RTRE0300.PI_DSTRY_DT%TYPE            /*등록자ID            */
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
    
  BEGIN
    
    IF (TRIM(reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(reg_Id)) THEN
        v_Return_Message := '등록자 ID('||reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    

    IF dvsn = 'I' THEN

        IF 0 != f_InsertRtre0300(
              slcm_ym             
            , lifnr                                 /*벤더코드            */
            , comm_Tamt                             /*벤더명     */
            , comm_Namt                             /*전화번호            */
            , comm_Vamt                             /*휴대폰번호            */
            , slip_No                               /*대리점코드            */
            , vndr_Nm                               /*세금계산서발행방법            */
            , vndr_Mob_No                           /*등록자ID            */
            , agency_Cd                             /*등록자ID            */
            , tax_Rqcd                              /*사용여부            */
            , rnt_Ofc                               /*등록자ID            */
            , rnt_Pnt                               /*등록자ID            */
            , rnt_Mst_Id                            /*등록자ID            */
            , mst_Mob_No                            /*등록자ID            */
            , mst_Email                             /*등록자ID            */
            , sms_Yn                                /*등록자ID            */
            , sms_Dt                                /*등록자ID            */
            , pi_Dstry_Yn                           /*등록자ID            */
            , pi_Dstry_Id                           /*등록자ID            */
            , pi_Dstry_Dt                           /*등록자ID            */
            , reg_Id                                /*등록자ID            */
            , v_ErrorText
        ) THEN
            v_Return_Message := '벤더정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText      := v_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE
    
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||dvsn||']';
        RAISE e_Error;
        
    END IF;

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0300.p_IUDRtre0300(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_Code   := -1;
        v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0300.p_IUDRtre0300(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0300;
     
  /*****************************************************************************
  -- 수수료 정보 Update
  *****************************************************************************/
  PROCEDURE p_ChargeSendSms (
      v_Slcm_ym         IN RTRE0300.SLCM_YM%TYPE  
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    ls_key      VARCHAR2(100);
    ln_cnt      NUMBER := 0;
    ln_chk      NUMBER := 0;    
    ls_err_msg  VARCHAR2(1000);
    
    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
    
    e_Error EXCEPTION;
    
  BEGIN

    FOR cur1 IN (
        SELECT  A1.SLCM_YM
             ,  A1.TAX_RQCD
             ,  A1.LIFNR
             ,  A1.VNDR_NM
             ,  A1.VNDR_MOB_NO
--             ,  '01034471919' AS VNDR_MOB_NO -- 01033753528(박정석G), 01034471919(박용식D) 
             ,  A1.COMM_NAMT
             ,  A1.COMM_VAMT
             ,  A1.COMM_TAMT
             ,  TO_CHAR(ADD_MONTHS(TO_DATE(A1.SLCM_YM,'YYYYMM'),1),'YYYYMM')||'01' AS TAX_DAY
             ,  A1.MST_EMAIL
             ,  B1.RNT_MST_NM
             ,  A1.MST_MOB_NO   
          FROM  RTRE0300 A1
             ,  RTCM0111 B1
         WHERE  1=1
           AND  A1.SLCM_YM      = v_Slcm_ym
           AND  A1.RNT_MST_ID   = B1.RNT_MST_ID(+)
           AND  A1.VNDR_MOB_NO IS NOT NULL
--           AND  A1.LIFNR       IN ('401810','405600','409329')
    ) LOOP
        ls_key := cur1.LIFNR;
        ln_cnt := ln_cnt + 1;
        
        v_Success_Code   := 0;
        v_Return_Message := '';
        v_ErrorText      := '';
        
        v_Sms_Msg := '[넥센타이어] '||SUBSTR(cur1.SLCM_YM,1,4)||'년 '||SUBSTR(cur1.SLCM_YM,5)||'월 수수료 마감 내역안내입니다.';        
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'벤더코드 : '||cur1.LIFNR;
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'벤더명 : '||cur1.VNDR_NM;
        
        IF cur1.TAX_RQCD IN ('P', 'S') THEN     --정발행, 간이과세자
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'작성일자 : '||TO_CHAR(TO_DATE(cur1.TAX_DAY,'YYYYMMDD'),'YYYY.MM.DD');      
        END IF;
        
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'품목명 : '||TO_NUMBER(SUBSTR(cur1.SLCM_YM,5))||'월 렌탈수수료';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'공급가액 : '||REPLACE(TO_CHAR(cur1.COMM_NAMT, '999,999,999'),' ','')||'원';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'부가세 : '||REPLACE(TO_CHAR(cur1.COMM_VAMT, '999,999,999'),' ','')||'원';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'총합계 : '||REPLACE(TO_CHAR(cur1.COMM_TAMT, '999,999,999'),' ','')||'원';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'발행일 : '||TO_CHAR(TO_DATE(cur1.TAX_DAY,'YYYYMMDD'),'YYYY.MM.DD');       
        
        IF cur1.TAX_RQCD = 'P' THEN     --정발행
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'E-mail : '||cur1.MST_EMAIL||' (계산서 수신 이메일)';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'※ 반드시 계산서는 상기 발급일자, 금액, 이메일 주소로 발급 요망';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'※ 국세청 전자세금계산서 공급가액 및 세액 자동계산 금액과 상이할 수 있으니 위 금액(원 단위) 유의하시고 발행해 주시기 바랍니다.';
        ELSIF cur1.TAX_RQCD = 'R' THEN  --역발행
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'스마트빌에 접속 후 승인처리하여 주시기 바랍니다.';
        ELSIF cur1.TAX_RQCD = 'S' THEN  --간이과세자
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'※ 반드시 계산서는 상기 발급일자, 금액으로 발급 요망';
        END IF;
        
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'자세한 내역은 https://portal.tirerental.co.kr 에서 수금관리 → 개별수수료내역조회 → 조회 기간 설정 후 확인하실 수 있습니다.';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'[ 담당마스터 ]';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'- 이름 : '||cur1.RNT_MST_NM||' 마스터';
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'- 연락처 : '||REGEXP_REPLACE(cur1.MST_MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3');
        v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||'※ 특이사항은 담당 마스터에게 연락해주세요.';  
        
        NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
              'I'                   /*예약 전송여부         */
            , NULL                  /*예약 전송시간         */
            , cur1.VNDR_MOB_NO      /*받는 전화번호         */
            , '18550100'            /*보내는 전화번호       */
            , v_Sms_Msg             /*메시지내용            */
            , '수수료계산서_'||cur1.SLCM_YM                /*사용자지정 필드       */
            , cur1.LIFNR                /*사용자지정 필드       */
            , '7'
            , NULL
            , reg_Id              /*등록자 ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );

        -- 수수료 세금계산서 SMS 발송정보 업데이트
        UPDATE  RTRE0300
           SET  SMS_YN  = 'Y'
             ,  SMS_DT  = SYSDATE
             ,  CHG_ID  = reg_Id
             ,  CHG_DT  = SYSDATE
         WHERE  SLCM_YM = cur1.SLCM_YM
           AND  LIFNR   = cur1.LIFNR;    
        
    END LOOP;

  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0300.p_ChargeSendSms(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_Code   := -1;
        v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0300.p_ChargeSendSms(2)', v_ErrorText, v_Return_Message);

  END p_ChargeSendSms;
   
END Pkg_Rtre0300;
/