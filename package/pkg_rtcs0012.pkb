CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0012 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0012
    PURPOSE     방문점검 컨택정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-03-27  wjim            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 컨택정보 Select
  *****************************************************************************/
  PROCEDURE p_sRTCS0012 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE           /* 계약번호         */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.STD_YM
         ,  A1.ORD_NO
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  A1.SEQ
         ,  A1.CALL_SEQ
         ,  A1.CALL_DAY
         ,  A1.CALL_TM
         ,  A1.CALL_DTL
         ,  A1.REG_ID
         ,  to_char(A1.REG_DT,'YYYYMMDDHH24MISS') AS REG_DT
         ,  A1.CHG_ID
         ,  to_char(A1.CHG_DT,'YYYYMMDDHH24MISS') AS CHG_DT
         ,  A1.RECALL_DAY
         ,  A1.RECALL_TM
      FROM  RTCS0012 A1    
     WHERE  A1.ORD_NO = DECODE(v_Ord_No, NULL, A1.ORD_NO, v_Ord_No)
    ;

  END p_sRTCS0012;
  
  /*****************************************************************************
  -- 방문점검 컨택정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTCS0012 (
      v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* 기준년월   */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* 계약번호   */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* 설비번호   */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* 작업순번   */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* 변경순번   */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT  INTO RTCS0012 (
          STD_YM
        , ORD_NO
        , EQU_NO
        , JOB_SEQ
        , SEQ        
        , CALL_SEQ
        , CALL_DAY
        , CALL_TM
        , CALL_DTL
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
        , RECALL_DAY
        , RECALL_TM
    ) VALUES (
          v_Std_Ym
        , v_Ord_No
        , v_Equ_No
        , v_Job_Seq
        , v_Seq
        , (
            SELECT  NVL2(MAX(CALL_SEQ), TO_NUMBER(MAX(CALL_SEQ))+1, 1) 
              FROM  RTCS0012
             WHERE  ORD_NO = v_Ord_No         
          )
        , v_Call_Day
        , v_Call_Tm
        , v_Call_Dtl
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
        , v_Recall_Day
        , v_Recall_Tm
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRTCS0012;
  
  /*****************************************************************************
  -- 방문점검 컨택정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0012 (
      v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* 기준년월   */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* 계약번호   */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* 설비번호   */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* 작업순번   */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* 변경순번   */
    , v_Call_Seq        IN RTCS0012.CALL_SEQ%TYPE   /* 상담순번   */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTCS0012
       SET  CALL_DAY   = v_Call_Day
         ,  CALL_TM    = v_Call_Tm
         ,  CALL_DTL   = v_Call_Dtl
         ,  CHG_ID     = v_Reg_Id
         ,  CHG_DT     = SYSDATE
         ,  RECALL_DAY = v_Recall_Day
         ,  RECALL_TM  = v_Recall_Tm
     WHERE  STD_YM     = v_Std_Ym
       AND  ORD_NO     = v_Ord_No
       AND  EQU_NO     = v_Equ_No
       AND  JOB_SEQ    = v_Job_Seq
       AND  SEQ        = v_Seq
       AND  CALL_SEQ   = v_Call_Seq
    ;     

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTCS0012;
  
  /*****************************************************************************
  -- 방문점검 컨택정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0012 (
      v_Comm_Dvsn       IN CHAR                     /* 처리구분(I,U,D) */
    , v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* 기준년월        */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* 계약번호        */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* 설비번호        */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* 작업순번        */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* 변경순번        */
    , v_Call_Seq        IN RTCS0012.CALL_SEQ%TYPE   /* 상담순번        */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* 상담일자        */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* 상담시간        */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* 상담내용        */   
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* 등록자ID        */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* 재컨택일자      */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* 재컨택시간      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
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
    
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRTCS0012 (
              v_Std_Ym
            , v_Ord_No
            , v_Equ_No
            , v_Job_Seq
            , v_Seq
            , v_Call_Day
            , v_Call_Tm
            , v_Call_Dtl 
            , v_Reg_Id
            , v_Recall_Day
            , v_Recall_Tm
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 상담정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRTCS0012 (
              v_Std_Ym  
            , v_Ord_No
            , v_Equ_No
            , v_Job_Seq
            , v_Seq    
            , v_Call_Seq
            , v_Call_Day
            , v_Call_Tm
            , v_Call_Dtl 
            , v_Reg_Id
            , v_Recall_Day
            , v_Recall_Tm
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 상담정보 수정 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0012.p_IUDRtcs0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0012.p_IUDRtcs0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0012;
        
END Pkg_Rtcs0012;