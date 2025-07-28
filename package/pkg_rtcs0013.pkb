CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0013 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0013
    PURPOSE     방문점검 거부철회 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] 신규개발
    1.1     2017-08-04  wjim            [20170804_01] 거부/철회 SMS 발송기능 추가
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 거부철회정보 조회
  *****************************************************************************/
  PROCEDURE p_sRTCS0013 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0013.ORD_NO%TYPE           /* 계약번호         */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.ORD_NO
         ,  A1.EQU_NO
         ,  C1.CUST_NM
         ,  A1.DENY_SEQ
         ,  A1.DENY_YN
         ,  A1.DENY_YMD
         ,  A1.DENY_ID
         ,  A1.DENY_STD_YM
         ,  A1.DENY_DESC
         ,  A1.WTHDRW_YMD
         ,  A1.WTHDRW_ID
         ,  A1.WTHDRW_STD_YM
         ,  A1.WTHDRW_DESC
         ,  A1.REG_ID
         ,  to_char(A1.REG_DT,'YYYYMMDDHH24MISS') AS REG_DT
         ,  A1.CHG_ID
         ,  to_char(A1.CHG_DT,'YYYYMMDDHH24MISS') AS CHG_DT
      FROM  RTCS0013 A1
         ,  RTSD0108 B1
         ,  RTSD0100 C1
     WHERE  A1.ORD_NO  = DECODE(v_Ord_No, NULL, A1.ORD_NO, v_Ord_No)
       AND  A1.ORD_NO  = B1.ORD_NO(+)
       AND  B1.CUST_NO = C1.CUST_NO(+)
     ORDER  BY A1.DENY_SEQ DESC
    ;

  END p_sRTCS0013;
  
  /*****************************************************************************
  -- 방문점검 거부등록
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] 신규개발
    1.1     2017-08-04  wjim            [20170804_01] SMS 발송기능 추가
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Deny (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* 계약번호        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* 설비번호        */
    , v_Deny_Std_Ym     IN RTCS0013.DENY_STD_YM%TYPE       /* 거부기준년월    */
    , v_Deny_Desc       IN RTCS0013.DENY_DESC%TYPE         /* 거부내용        */       
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* 등록자ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ls_Equ_No   RTCS0001.EQU_NO%TYPE;
    ls_Mob_No   RTCS0006.MOB_NO%TYPE;
    ls_Sms_Msg  RTSD0205.SND_MSG%TYPE := '';
    ln_chk_cnt  NUMBER DEFAULT 0;    
    
    e_Error     EXCEPTION;
    
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   
    --설비번호를 전달할 수 없는 경우를 대비
    --설비번호가 없으면 계약번호로 조회
    IF TRIM(v_Equ_No) IS NULL THEN
        SELECT  EQU_NO
          INTO  ls_Equ_No
          FROM  RTCS0001
         WHERE  ORD_NO = v_Ord_No;
    ELSE
        ls_Equ_No := v_Equ_No;
    END IF;
    
    --해당 계약이 거부상태인지 확인
    SELECT  COUNT(*)
      INTO  ln_chk_cnt
      FROM  RTCS0013
     WHERE  ORD_NO = v_Ord_No
       AND  EQU_NO = ls_Equ_No
       AND  DENY_YN = 'Y'
    ;
    
    --이미 거부상태인 경우 오류처리
    IF ln_chk_cnt > 0 THEN
        v_Return_Message := '이미 방문점검 거부상태이므로 거부등록이 불가합니다!';
        RAISE e_Error;
    END IF;
    
    --방문점검 거부철회 정보 등록
    INSERT INTO RTCS0013 (
          ORD_NO
        , EQU_NO
        , DENY_SEQ
        , DENY_YN
        , DENY_YMD        
        , DENY_ID
        , DENY_STD_YM
        , DENY_DESC
        , WTHDRW_YMD
        , WTHDRW_ID
        , WTHDRW_STD_YM
        , WTHDRW_DESC
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT    
    ) VALUES (
          v_Ord_No
        , ls_Equ_No
        , (
            SELECT  NVL2(MAX(DENY_SEQ), TO_NUMBER(MAX(DENY_SEQ))+1, 1) 
              FROM  RTCS0013
             WHERE  ORD_NO = v_Ord_No
               AND  EQU_NO = ls_Equ_No
          )
        , 'Y'
        , TO_CHAR(SYSDATE, 'YYYYMMDD')
        , v_Reg_Id
        , v_Deny_Std_Ym
        , v_Deny_Desc
        , NULL
        , NULL
        , NULL
        , NULL
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    --방문점검 작업목록을 거부로 수정
    -- -거부기준월 이후 처리상태가'초기배정'인 건들을 '점검거부' 상태로 변경
    UPDATE  RTCS0005
       SET  CHK_STAT  = '05'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  EQU_NO    = ls_Equ_No
       AND  STD_YM   >= v_Deny_Std_Ym
       AND  CHK_STAT IN ('01')
    ;
    
    -- 거부등록 SMS 발송 [20170804_01]
    BEGIN
        -- SMS발송 기준 = 가장 최근 배정정보의 휴대폰번호 
        SELECT  MOB_NO
          INTO  ls_Mob_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO, X.EQU_NO ORDER BY X.STD_YM DESC, X.JOB_SEQ DESC, X.SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0006 X
                     WHERE  X.ORD_NO = v_Ord_No
                       AND  X.EQU_NO = v_Equ_No
                )
         WHERE  ROW_NUM = 1;
        
        -- SMS 메시지 
        ls_Sms_Msg := '[넥센타이어] 고객님께 배정될 방문점검 서비스는 고객님의 요청에 의해 향 후 점검 서비스 배정이 중단됩니다.';
        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
        ls_Sms_Msg := ls_Sms_Msg||'방문점검 서비스를 원하실 경우 넥스트레벨 콜센터(1855-0100)으로 문의주시기 바랍니다.';
         
         Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
              'I'                   /*예약 전송여부         */
            , NULL                  /*예약 전송시간         */
            , ls_Mob_No             /*받는 전화번호         */
            , '18550100'            /*보내는 전화번호       */
            , ls_Sms_Msg            /*메시지내용            */
            , 'S017'                /*사용자지정 필드       */
            , v_Ord_No              /*사용자지정 필드       */
            , '2'
            , 'RENTAL00000000000053'
            , v_Reg_Id              /*등록자 ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
            
        IF v_Success_Code <> 0 THEN
            v_Return_Message := '거부등록 SMS발송실패(1):'||v_ErrorText;
            RAISE e_Error;
        END IF;
    
    EXCEPTION
        WHEN OTHERS THEN
            v_Return_Message := '거부등록 SMS 발송실패(2):'||SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
    END;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Deny(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Deny(2)', v_ErrorText, v_Return_Message);

  END p_SaveRtcs0013Deny;
  
  /*****************************************************************************
  -- 방문점검 철회등록
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] 신규개발
    1.1     2017-08-04  wjim            [20170804_01] SMS 발송기능 추가
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Withdraw (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* 계약번호        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* 설비번호        */
    , v_Deny_Seq        IN RTCS0013.DENY_SEQ%TYPE          /* 거부순번        */
    , v_Wthdrw_Std_Ym   IN RTCS0013.WTHDRW_STD_YM%TYPE     /* 철회기준년월    */
    , v_Wthdrw_Desc     IN RTCS0013.WTHDRW_DESC%TYPE       /* 철회내용        */       
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* 등록자ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    lr_Cs0013   RTCS0013%ROWTYPE;
    ls_Mob_No   RTCS0006.MOB_NO%TYPE;
    ls_Sms_Msg  RTSD0205.SND_MSG%TYPE := '';
    
    e_Error     EXCEPTION;
    
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;
    
    --검증을 위해 기존 거부정보 조회
    SELECT  *
      INTO  lr_Cs0013
      FROM  RTCS0013
     WHERE  ORD_NO   = v_Ord_No
       AND  EQU_NO   = v_Equ_No
       AND  DENY_SEQ = v_Deny_Seq;

    --거부상태가 아닌 경우 오류처리
    IF lr_Cs0013.DENY_YN = 'N' THEN
        v_Return_Message := '거부상태가 아니라 철회할 수 없습니다!';
        RAISE e_Error;
    END IF;
    
    --거부기준월과 철회기준월이 다른 경우 오류처리
    -- - 원래 다를 수 있도록 설계했으나 처리 로직이 복잡하여 일단 동일한 상황만 처리가능하도록 막음 
    IF lr_Cs0013.DENY_STD_YM <> v_Wthdrw_Std_Ym  THEN
        v_Return_Message := '거부기준월('||lr_Cs0013.DENY_STD_YM||')과 철회기준월('||v_Wthdrw_Std_Ym||')이 다릅니다!';
        RAISE e_Error;
    END IF;
    
    --방문점검 거부철회정보 수정
    UPDATE  RTCS0013
       SET  DENY_YN       = 'N'
         ,  WTHDRW_YMD    = TO_CHAR(SYSDATE, 'YYYYMMDD')
         ,  WTHDRW_ID     = v_Reg_Id
         ,  WTHDRW_STD_YM = v_Wthdrw_Std_Ym
         ,  WTHDRW_DESC   = v_Wthdrw_Desc
         ,  CHG_ID        = v_Reg_Id
         ,  CHG_DT        = SYSDATE
     WHERE  ORD_NO        = v_Ord_No
       AND  EQU_NO        = v_Equ_No
       AND  DENY_SEQ      = v_Deny_Seq;
       
    --방문점검 작업목록을 철회상태로 수정
    -- -철회기준월 이후 처리상태가'점검거부'인 건들을 '초기배정' 상태로 변경
    UPDATE  RTCS0005
       SET  CHK_STAT  = '01'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  EQU_NO    = v_Equ_No
       AND  STD_YM   >= v_Wthdrw_Std_Ym
       AND  CHK_STAT IN ('05'); 

    -- 철회등록 SMS 발송 [20170804_01]
    BEGIN
        -- SMS발송 기준 = 가장 최근 배정정보의 휴대폰번호 
        SELECT  MOB_NO
          INTO  ls_Mob_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO, X.EQU_NO ORDER BY X.STD_YM DESC, X.JOB_SEQ DESC, X.SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0006 X
                     WHERE  X.ORD_NO = v_Ord_No
                       AND  X.EQU_NO = v_Equ_No
                )
         WHERE  ROW_NUM = 1;
        
        -- SMS 메시지 
        ls_Sms_Msg := '[넥센타이어] 요청하신대로 넥스트레벨 방문점검 서비스 배정 중단이 해지되었습니다.';
         
        Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
              'I'                   /*예약 전송여부         */
            , NULL                  /*예약 전송시간         */
            , ls_Mob_No             /*받는 전화번호         */
            , '18550100'            /*보내는 전화번호       */
            , ls_Sms_Msg            /*메시지내용            */
            , 'S018'                /*사용자지정 필드       */
            , v_Ord_No              /*사용자지정 필드       */
            , '2'
            , 'RENTAL00000000000054'
            , v_Reg_Id              /*등록자 ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
            
        IF v_Success_Code <> 0 THEN
            v_Return_Message := '철회등록 SMS발송실패(1):'||v_ErrorText;
            RAISE e_Error;
        END IF;
    
    EXCEPTION
        WHEN OTHERS THEN
            v_Return_Message := '철회등록 SMS 발송실패(2):'||SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
    END;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Withdraw(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Withdraw(2)', v_ErrorText, v_Return_Message);

  END p_SaveRtcs0013Withdraw;
        
END Pkg_Rtcs0013;