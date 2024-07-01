CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_ZTSD0008 AS

  PROCEDURE p_sZtsd0008 (
    Ref_Cursor  IN OUT SYS_REFCURSOR, 
    v_PRICE_CD               ZTSD0008.PRICE_CD%TYPE, /*가격,금액유형         */
    v_MAT_CD                 ZTSD0008.MAT_CD%TYPE,   /*상품코드              */
    v_PERIOD_CD              ZTSD0008.PERIOD_CD%TYPE,/*기간코드              */ 
    v_CNT_CD                 ZTSD0008.CNT_CD%TYPE,   /*타이어본수            */ 
    v_REGI_CD                ZTSD0008.REGI_CD%TYPE,  /*등록비코드            */ 
    v_STR_DAY                ZTSD0008.STR_DAY%TYPE,  /*가격적용 시작일       */ 
    v_END_DAY                ZTSD0008.END_DAY%TYPE,  /*가격적용 완료일       */
    v_SEQ                    ZTSD0008.SEQ%TYPE, 
    v_AMT                    ZTSD0008.AMT%TYPE,      /*금액                  */ 
    v_USE_YN                 ZTSD0008.USE_YN%TYPE, 
    v_REG_ID                 ZTSD0008.REG_ID%TYPE
  ) IS
  BEGIN
    Open Ref_Cursor for
    select A.PRICE_CD
          , A.MAT_CD
          , '' MAT_NM
          , A.PERIOD_CD
          , A.CNT_CD
          , A.REGI_CD
          , A.STR_DAY
          , A.END_DAY
          , A.SEQ
          , A.AMT
          , A.USE_YN
          , A.REG_ID
          , A.REG_DT
          , A.CHG_ID
          , A.CHG_DT
     from ZTSD0008 A
    where 1=1
     AND   A.PRICE_CD  = DECODE(v_Price_Cd  , NULL, A.PRICE_CD  , v_Price_Cd)
     AND    A.PERIOD_CD = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)    
     AND    A.CNT_CD    = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
     AND     A.MAT_CD    = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
     --and A.MAT_CD = '12370NX'     
     --and A.regi_cd = '0003'
    --and A.seq = 1
    --and A.reg_id = 'admin'      
  ;
  
  /*
  insert into ZTDBGLOG(parm_nm, parm_val)
  values ('v_CNT_CD', v_CNT_CD);  
  commit;
  */
  
  END p_sZtsd0008;

  /*****************************************************************************
  -- 가격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    v_Seq := f_sZtsd0008MaxSeq(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd, v_Str_Day, v_End_Day);

    INSERT  INTO Ztsd0008 (
            PRICE_CD,
            MAT_CD,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            STR_DAY,
            END_DAY,
            SEQ,
            AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Price_Cd,
            v_Mat_Cd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Regi_Cd,
            '20181008',
            '20181030',
            v_Seq,
            v_Amt,
            v_Use_Yn,
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

  END f_InsertZtsd0008;

  /*****************************************************************************
  -- 가격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE Ztsd0008
    SET    AMT       = v_Amt,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateZtsd0008;

  /*****************************************************************************
  -- 가격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE Ztsd0008
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteZtsd0008;

  /*****************************************************************************
  -- 가격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDZtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 가격_금액유형 , 상품코드,기간코드,타이어본수, 등록비코드,가격적용 시작일,가격적용 완료일,  사용여부 ,등록자 ID
    /*IF 0 = f_sZtsd0008Count(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                            v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq) THEN */
    IF v_Comm_Dvsn = 'I' THEN                            
        IF 0 != f_InsertZtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '가격 관리 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateZtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '가격 관리 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteZtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '가격 관리 삭제 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;

begin
  insert into ZTDBGLOG(parm_nm, parm_val)
  values ('v_Comm_Dvsn', v_Comm_Dvsn);  
  commit;
end;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Ztsd0008.p_IUDZtsd0008(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Ztsd0008.p_IUDZtsd0008(2)', v_ErrorText, v_Return_Message);

  END p_IUDZtsd0008;

  FUNCTION f_sZtsd0008MaxSeq (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE          /*가격적용 완료일     */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT
                        SEQ + 1
                FROM    Ztsd0008
                WHERE   PRICE_CD   = v_Price_Cd
                AND     MAT_CD     = v_Mat_Cd
                AND     PERIOD_CD  =  v_Period_Cd
                AND     CNT_CD     = v_Cnt_Cd
                AND     REGI_CD    = v_Regi_Cd
                AND     STR_DAY    = v_Str_Day
                AND     END_DAY    = v_End_Day
                AND     ROWNUM    <= 1), 1)
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sZtsd0008MaxSeq;

  /*****************************************************************************
  -- 가격 관리 Count
  *****************************************************************************/
  FUNCTION f_sZtsd0008Count(
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,          /*가격적용 완료일     */
    v_Seq            IN Ztsd0008.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    Ztsd0008
    WHERE   PRICE_CD  = v_Price_Cd
    AND     MAT_CD    = v_Mat_Cd
    AND     PERIOD_CD = v_Period_Cd
    AND     CNT_CD    = v_Cnt_Cd
    AND     REGI_CD   = v_Regi_Cd
    AND     STR_DAY   = v_Str_Day
    AND     END_DAY   = v_End_Day
    AND     SEQ       = v_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sZtsd0008Count;


END PKG_ZTSD0008;
/
