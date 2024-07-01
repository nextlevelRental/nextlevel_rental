CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0150 AS
/*******************************************************************************
    NAME        PKG_RTRE0150
    PURPOSE     충당금 지급내역

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-11-17  wjim            [20171117_02] 신규 생성
*******************************************************************************/

  /*****************************************************************************
  -- 충당금 지급내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0150 (
      Ref_Cursor        IN OUT SYS_REFCURSOR    
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*등록순번               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */
    , v_LOGIN_ID        IN VARCHAR2                  /* 로그인ID: 관련항목 범위 지정 */
    , v_LOGIN_GRP       IN VARCHAR2                  /* 로그인 사용자 그룹 */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A1.REG_YM
         ,  A1.REG_SEQ
         ,  A1.AGENCY_CD
         ,  B1.AGENCY_NM
         ,  A1.PAY_DAY
         ,  A1.PAY_AMT
         ,  A1.PAY_MSG
         ,  A1.USE_YN
         ,  A1.REG_ID
         ,  TO_CHAR(A1.REG_DT, 'YYYYMMDDHH24MISS') AS REG_DT 
         ,  A1.CHG_ID
         ,  TO_CHAR(A1.CHG_DT, 'YYYYMMDDHH24MISS') AS CHG_DT
      FROM  RTRE0150 A1
         ,  RTSD0007 B1
     WHERE  1=1
       AND  A1.AGENCY_CD = B1.AGENCY_CD(+)
       AND  A1.REG_YM    = DECODE(v_Reg_Ym   , NULL, A1.REG_YM   , v_Reg_Ym   )
       AND  A1.REG_SEQ   = DECODE(v_Reg_Seq  , NULL, A1.REG_SEQ  , v_Reg_Seq  )
       AND  A1.AGENCY_CD = DECODE(v_Agency_Cd, NULL, A1.AGENCY_CD, v_Agency_Cd)
       AND  A1.PAY_DAY   = DECODE(v_Pay_Day  , NULL, A1.PAY_DAY  , v_Pay_Day  )
       AND  A1.USE_YN    = DECODE(v_Use_Yn   , NULL, A1.USE_YN   , v_Use_Yn   )       
       AND  A1.REG_ID    = DECODE(v_Reg_Id   , NULL, A1.REG_ID   , v_Reg_Id   )
     ORDER  BY A1.REG_YM
         ,  A1.REG_SEQ
         ) A
         LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
    ;

  END p_sRtre0150;
  
  /*****************************************************************************
  -- 충당금 지급내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0150 (      
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */  
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS  
  
  BEGIN
    
    INSERT INTO RTRE0150 (
          REG_YM
        , REG_SEQ
        , AGENCY_CD
        , PAY_DAY
        , PAY_AMT
        , PAY_MSG
        , USE_YN        
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          v_Reg_Ym
        , (
            SELECT  TO_NUMBER(NVL(MAX(REG_SEQ),0))+1 
              FROM  RTRE0150
             WHERE  REG_YM = v_Reg_Ym
          )
        , v_Agency_Cd
        , v_Pay_Day
        , v_Pay_Amt
        , v_Pay_Msg
        , v_Use_Yn
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

  END f_InsertRtre0150;
  
  /*****************************************************************************
  -- 충당금 지급내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0150 (
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*등록순번               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTRE0150
       SET  AGENCY_CD = v_Agency_Cd
         ,  PAY_DAY   = v_Pay_Day
         ,  PAY_AMT   = v_Pay_Amt
         ,  PAY_MSG   = v_Pay_Msg
         ,  USE_YN    = v_Use_Yn
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  REG_YM    = v_Reg_Ym
       AND  REG_SEQ   = v_Reg_Seq
    ;     

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0150;
  
  /*****************************************************************************
  -- 충당금 지급내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0150 (
      v_Comm_Dvsn       IN CHAR                      /* 처리구분(I,U,D)       */
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*등록순번               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */     
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    ls_Slcm_Ym      VARCHAR2(6);        --마지막 집계/마감년월
    ln_Btapfd_Amt   NUMBER(13);         --이전월까지의 충당누계액
    ln_Pay_Amt      NUMBER(13);         --당월 현재까지 등록된 지급 충당금 총액
    
    lr_RE0150       RTRE0150%ROWTYPE;

    e_Error         EXCEPTION;
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Agency_Cd) IS NULL THEN
        v_Return_Message := '대리점코드 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Pay_Day) IS NULL THEN
        v_Return_Message := '지급일자 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 입력값 검증
    IF v_Pay_Amt <= 0 THEN
        v_Return_Message := '지급금액('||v_Pay_Amt||') : 지급금액은 0원 이상이어야 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 마지막 집계/마감월 조회
    -- - 충당금 집계가 완료되면 해당월 또는 이전월로는 신규 등록 및 수정 불가
    SELECT  SUBSTR(MAX(APFD_DAY), 1, 6)
      INTO  ls_Slcm_Ym 
      FROM  RTRE5080;
      
    -- 입력 지급월이 이미 집계된 경우 등록/수정 불가
    IF SUBSTR(v_Pay_Day, 1, 6) <= ls_Slcm_Ym THEN
        v_Return_Message := '입력 지급년월('||SUBSTR(v_Pay_Day, 1, 6)||') : 해당 지급월은 이미 집계 또는 마감되었습니다!';
        RAISE e_Error;
    END IF;
    
    -- 입력한 지급액이 기존 충당금 누계액보다 많은지 확인
    -- 단, 사용여부를 'N'으로 입력/수정하는 경우는 제외
    IF v_Use_Yn = 'Y' THEN
        -- 이전달까지 해당 대리점 충당금 누계액 조회
        SELECT  NVL(SUM(APFD_PAMT), 0) - NVL(SUM(APFD_MAMT), 0)
          INTO  ln_Btapfd_Amt
          FROM  RTRE5080
         WHERE  AGENCY_CD = v_Agency_Cd;
        
        -- 당월 현재까지 등록된 지급 충당금 합계 조회 
        SELECT  NVL(SUM(PAY_AMT), 0)
          INTO  ln_Pay_Amt
          FROM  RTRE0150
         WHERE  AGENCY_CD  = v_Agency_Cd
           AND  PAY_DAY LIKE SUBSTR(v_Pay_Day, 1, 6)||'%'
           AND  USE_YN     = 'Y';
        
        -- 입력한 충당지급금액이 지난달까지의 충당누계액보다 클 수 없음    
        IF ln_Btapfd_Amt - ln_Pay_Amt - v_Pay_Amt < 0 THEN
            v_Return_Message := '지급금액('||v_Pay_Amt||') : 입력한 지급금액이 기존 충당금 누계액('||ln_Btapfd_Amt||'-'||ln_Pay_Amt||')을 초과합니다!';
            RAISE e_Error;
        END IF;  
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0150 (
              TO_CHAR(SYSDATE, 'YYYYMM')  
            , v_Agency_Cd
            , v_Pay_Day
            , v_Pay_Amt
            , v_Pay_Msg
            , v_Use_Yn
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '충당금 지급내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN
        
        -- 수정전 충당금 지급내역 조회
        SELECT  *
          INTO  lr_RE0150
          FROM  RTRE0150
         WHERE  REG_YM  = v_Reg_Ym
           AND  REG_SEQ = v_Reg_Seq;
        
        -- 기존 지급월이 이미 집계된 경우 수정 불가
        IF SUBSTR(lr_RE0150.PAY_DAY, 1, 6) <= ls_Slcm_Ym THEN
            v_Return_Message := '기존 지급년월('||SUBSTR(lr_RE0150.PAY_DAY, 1, 6)||') : 해당 지급월은 이미 집계 또는 마감되었습니다!';
            RAISE e_Error;
        END IF;

        IF 0 != f_UpdateRtre0150 (
              v_Reg_Ym
            , v_Reg_Seq
            , v_Agency_Cd
            , v_Pay_Day
            , v_Pay_Amt
            , v_Pay_Msg
            , v_Use_Yn
            , v_Reg_Id    
            , v_ErrorText
        ) THEN
            v_Return_Message := '충당금 지급내역 수정 실패!!!'||'-'||v_ErrorText;
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
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtre0150.p_IUDRtre0150(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtre0150.p_IUDRtre0150(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0150;
        
END PKG_RTRE0150;
/
