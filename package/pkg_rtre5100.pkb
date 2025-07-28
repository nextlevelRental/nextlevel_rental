CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE5100 AS
/*******************************************************************************
    NAME        PKG_RTRE5100
    PURPOSE     방문점검수수료 변경 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-25  wjim            [20170519_01] 신규작성
*******************************************************************************/

  /*****************************************************************************
  -- 작업회차 채번
  *****************************************************************************/
  FUNCTION f_sRtre5100JobSeq (
    v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE           /*마감년월            */
  ) RETURN NUMBER IS
  
    ln_Job_Seq RTRE5100.JOB_SEQ%TYPE DEFAULT NULL;      /*작업회차            */
    
  BEGIN

    SELECT  NVL((   
                    SELECT  MAX(JOB_SEQ)
                      FROM  RTRE5100
                     WHERE  SLCM_YM  = v_Slcm_Ym
                 ) + 1, 1) AS JOB_SEQ
      INTO  ln_Job_Seq
      FROM  DUAL;

    RETURN ln_Job_Seq;

  EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre5100JobSeq;

  /*****************************************************************************
  -- 방문점검수수료 변경 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5100 (
      v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*마감년월            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*작업회차            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*배정기준년월        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*계약번호            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*변경수수료          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*작업자 ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT INTO RTRE5100 (
          SLCM_YM
        , JOB_SEQ
        , STD_YM
        , ORD_NO
        , AMT_COMM
        , REG_ID        
        , REG_DT
        , CHG_ID
        , CHG_DT              
    ) VALUES (
          v_Slcm_Ym
        , v_Job_Seq
        , v_Std_Ym
        , v_Ord_No
        , v_Amt_Comm        
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

  END f_InsertRtre5100;
  
  /*****************************************************************************
  -- 방문점검수수료 변경 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5100 (
      v_Comm_Dvsn      IN CHAR                          /*처리구분(I,U,D)     */
    , v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*마감년월            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*작업회차            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*배정기준년월        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*계약번호            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*변경수수료          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*작업자 ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    v_Chk   number;
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값 확인   
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 당월 서비스수수료 집계 진행여부 확인
     */
    SELECT  COUNT(*)
      INTO  v_Chk
      FROM  RTRE5060
     WHERE  SLCM_YM = v_Slcm_Ym;
    
    IF v_Chk > 0 THEN
        v_Return_Message := '해당월('||v_Slcm_Ym||') 서비스수수료 기초집계작업이 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN        
        
        -- 방문점검수수료 변경 등록
        IF 0 != f_InsertRtre5100 (
              v_Slcm_Ym
            , v_Job_Seq
            , v_Std_Ym
            , v_Ord_No
            , v_Amt_Comm            
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검수수료 변경 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- 방문점검수수료 변경
        IF 0 != PKG_RTRE5090.f_UpdateRtre5090Commamt (
              v_Slcm_Ym
            , v_Std_Ym
            , v_Ord_No
            , v_Amt_Comm
            , v_Job_Seq
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검수수료 변경 실패!!!'||'-'||v_ErrorText;
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
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5100.p_IUDRtre5100(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5100.p_IUDRtre5100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5100;

END PKG_RTRE5100;